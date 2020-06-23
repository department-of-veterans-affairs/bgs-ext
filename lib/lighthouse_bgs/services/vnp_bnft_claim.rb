# frozen_string_literal: true

# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.

module LighthouseBGS
  class VnpBnftClaimService < LighthouseBGS::Base
    def bean_name
      'VnpBnftClaimWebServiceBean'
    end

    def self.service_name
      'vnp_bnft_claim'
    end

    def vnp_bnft_claim_create(options)
    validate_required_keys(vnp_bnft_claim_create_required_fields, options, __method__.to_s)

      response = request(
        :vnp_bnft_claim_create,
        {
          "arg0": {
            "vnpProcID": options[:vnp_proc_id],
            "vnpBnftClaimId": options[:vnp_bnft_claim_id],
            "bnftClaimTypeCd": options[:bnft_claim_type_cd],
            "claimRcvdDt": options[:claim_rcvd_dt],
            "jrnDt": options[:jrn_dt],
            "jrnLctnId": options[:jrn_lctn_id],
            "jrnObjId": options[:jrn_obj_id],
            "jrnStatusTypeCd": options[:jrn_status_type_cd],
            "jrnUserId": options[:jrn_user_id],
            "pgmTypeCd": options[:pgm_type_cd],
            "ptcpntClmantId": options[:ptcpnt_clmant_id],
            "statusTypeCd": options[:status_type_cd],
            "svcTypeCd": options[:svc_type_cd],
            "applcnId": options[:applcn_id],
            "atchmsInd": options[:atchms_ind],
            "claimJrsdtnLctnId": options[:claim_jrsdtn_lctn_id],
            "claimSuspnsDt": options[:claim_suspns_dt],
            "endPrdctTypeCd": options[:end_prdct_type_cd],
            "infrmlInd": options[:infrml_ind],
            "intakeJrsdtnLctnId": options[:intake_jrsdtn_lctn_id],
            "lastPaidDt": options[:last_paid_dt],
            "payeeTypeCd": options[:payee_type_cd],
            "ptcpntDpositAcntId": options[:ptcpnt_dposit_acnt_id],
            "ptcpntVsrId": options[:ptcpnt_vsr_id],
            "rmksTxt": options[:rmks_txt],
            "ptcpntMailAddrsId": options[:ptcpnt_mail_addrs_id],
            "ptcpntPymtAddrsId": options[:ptcpnt_pymt_addrs_id],
            "termnlDigitNbr": options[:termnl_digit_nbr],
            "vnpPtcpntVetId": options[:vnp_ptcpnt_vet_id],
            "bnftClaimId": options[:bnft_claim_id]
          }
        },
        options[:ssn]
      )

      response.body[:vnp_bnft_claim_create_response][:return]
    end

    def vnp_bnft_claim_update(options)
    validate_required_keys(vnp_bnft_claim_update_required_fields, options, __method__.to_s)

      response = request(
        :vnp_bnft_claim_update,
        {
          "arg0": {
            "vnpBnftClaimId": options[:vnp_bnft_claim_id],
            "bnftClaimTypeCd": options[:bnft_claim_type_cd],
            "claimRcvdDt": options[:claim_rcvd_dt],
            "jrnDt": options[:jrn_dt],
            "jrnLctnId": options[:jrn_lctn_id],
            "jrnObjId": options[:jrn_obj_id],
            "jrnStatusTypeCd": options[:jrn_status_type_cd],
            "jrnUserId": options[:jrn_user_id],
            "pgmTypeCd": options[:pgm_type_cd],
            "ptcpntClmantId": options[:ptcpnt_clmant_id],
            "statusTypeCd": options[:status_type_cd],
            "svcTypeCd": options[:svc_type_cd],
            "vnpProcID": options[:vnp_proc_id],
            "applcnId": options[:applcn_id],
            "atchmsInd": options[:atchms_ind],
            "claimJrsdtnLctnId": options[:claim_jrsdtn_lctn_id],
            "claimSuspnsDt": options[:claim_suspns_dt],
            "endPrdctTypeCd": options[:end_prdct_type_cd],
            "infrmlInd": options[:infrml_ind],
            "intakeJrsdtnLctnId": options[:intake_jrsdtn_lctn_id],
            "lastPaidDt": options[:last_paid_dt],
            "payeeTypeCd": options[:payee_type_cd],
            "ptcpntDpositAcntId": options[:ptcpnt_dposit_acnt_id],
            "ptcpntVsrId": options[:ptcpnt_vsr_id],
            "rmksTxt": options[:rmks_txt],
            "ptcpntMailAddrsId": options[:ptcpnt_mail_addrs_id],
            "ptcpntPymtAddrsId": options[:ptcpnt_pymt_addrs_id],
            "termnlDigitNbr": options[:termnl_digit_nbr],
            "vnpPtcpntVetId": options[:vnp_ptcpnt_vet_id],
            "bnftClaimId": options[:bnft_claim_id]
          }
        },
        options[:ssn]
      )

      response.body[:vnp_bnft_claim_update_response][:return]
    end

    private

    def vnp_bnft_claim_create_required_fields
      %i[
        vnp_proc_id
        bnft_claim_type_cd
        claim_rcvd_dt
        jrn_dt
        jrn_lctn_id
        jrn_obj_id
        jrn_status_type_cd
        jrn_user_id
        pgm_type_cd
        ptcpnt_clmant_id
        status_type_cd
        svc_type_cd
      ]
    end

    def vnp_bnft_claim_update_required_fields
      %i[
        vnp_bnft_claim_id
        bnft_claim_type_cd
        claim_rcvd_dt
        jrn_dt
        jrn_lctn_id
        jrn_obj_id
        jrn_status_type_cd
        jrn_user_id
        pgm_type_cd
        ptcpnt_clmant_id
        status_type_cd
        svc_type_cd
        vnp_proc_id
        intake_jrsdtn_lctn_id
        claim_jrsdtn_lctn_id
      ]
    end
  end
end
