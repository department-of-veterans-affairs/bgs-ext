# frozen_string_literal: true

# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.

module BGS
  class BenefitClaimWebService2 < BGS::Base
    def bean_name
      'BenefitClaimWebServiceBean'
    end

    def self.service_name
      'benefit_claims'
    end

    def find_bnft_claim(bnft_claim_id)
      response = request(:find_bnft_claim, 'bnftClaimId': bnft_claim_id)
      response.body[:find_bnft_claim_response][:bnft_claim_dto]
    end

    def update_bnft_claim(bnft_claim) # rubocop:disable Metrics/MethodLength
      validate_required_keys(required_update_bnft_claim_fields, bnft_claim, __method__.to_s)

      response = request(
        :update_bnft_claim,
        {
          "bnftClaimDTO": {
            "bnftClaimId": bnft_claim[:bnft_claim_id],
            "bnftClaimTypeCd": bnft_claim[:bnft_claim_type_cd],
            "bnftClaimTypeLabel": bnft_claim[:bnft_claim_type_label],
            "bnftClaimTypeNm": bnft_claim[:bnft_claim_type_nm],
            "bnftClaimUserDisplay": bnft_claim[:bnft_claim_user_display],
            "claimJrsdtnLctnId": bnft_claim[:claim_jrsdtn_lctn_id],
            "claimRcvdDt": bnft_claim[:claim_rcvd_dt],
            "claimSuspnsDt": bnft_claim[:claim_suspns_dt],
            "cpClaimEndPrdctTypeCd": bnft_claim[:cp_claim_end_prdct_type_cd],
            "jrnDt": bnft_claim[:jrn_dt],
            "jrnLctnId": bnft_claim[:jrn_lctn_id],
            "jrnObjId": bnft_claim[:jrn_obj_id],
            "jrnStatusTypeCd": bnft_claim[:jrn_status_type_cd],
            "jrnUserId": bnft_claim[:jrn_user_id],
            "payeeTypeCd": bnft_claim[:payee_type_cd],
            "payeeTypeNm": bnft_claim[:payee_type_nm],
            "pgmTypeCd": bnft_claim[:pgm_type_cd],
            "pgmTypeNm": bnft_claim[:pgm_type_nm],
            "ptcpntClmantId": bnft_claim[:ptcpnt_clmant_id],
            "ptcpntClmantNm": bnft_claim[:ptcpnt_clmant_nm],
            "ptcpntDpositAcntId": bnft_claim[:ptcpnt_dposit_acnt_id],
            "ptcpntMailAddrsId": bnft_claim[:ptcpnt_mail_addrs_id],
            "ptcpntVetId": bnft_claim[:ptcpnt_vet_id],
            "stationOfJurisdiction": bnft_claim[:station_of_jurisdiction],
            "statusTypeCd": bnft_claim[:status_type_cd],
            "statusTypeNm": bnft_claim[:status_type_nm],
            "svcTypeCd": bnft_claim[:svc_type_cd],
            "tempJrsdtnLctnId": bnft_claim[:temp_jrsdtn_lctn_id],
            "temporaryStationOfJurisdiction": bnft_claim[:temporary_station_of_jurisdiction],
            "termnlDigitNbr": bnft_claim[:termnl_digit_nbr]
          }
        },
        bnft_claim[:bnft_claim_id]
      )

      response.body
    end

    private

    def required_update_bnft_claim_fields
      %i[bnft_claim_id]
    end
  end
end
