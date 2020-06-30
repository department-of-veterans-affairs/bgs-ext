# frozen_string_literal: true

# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.

module BGS
  class VnpPtcpntRlnshpService < BGS::Base
    def bean_name
      'VnpPtcpntRlnshpWebServiceBean'
    end

    def self.service_name
      'vnp_ptcpnt_rlnshp'
    end

    def vnp_ptcpnt_rlnshp_create(options)
      validate_required_keys(vnp_ptcpnt_rlnshp_create_required_fields, options, __method__.to_s)

      response = request(
        :vnp_ptcpnt_rlnshp_create,
        {
          "arg0": {
            vnpPtcpntRlnshpId: options[:vnp_ptcpnt_rlnshp_id],
            beginDt: options[:begin_dt],
            childPrevlyMarriedInd: options[:child_prevly_married_ind],
            endDt: options[:end_dt],
            eventDt: options[:event_dt],
            familyRlnshpTypeNm: options[:family_rlnshp_type_nm],
            fidAttntnTxt: options[:fid_attntn_txt],
            hlthcrPrvdrRlseInd: options[:hlthcr_prvdr_rlse_ind],
            jrnDt: options[:jrn_dt],
            jrnLctnId: options[:jrn_lctn_id],
            jrnObjId: options[:jrn_obj_id],
            jrnStatusTypeCd: options[:jrn_status_type_cd],
            jrnUserId: options[:jrn_user_id],
            livesWithRelatdPersonInd: options[:lives_with_relatd_person_ind],
            marageCityNm: options[:marage_city_nm],
            marageCntryNm: options[:marage_cntry_nm],
            marageStateCd: options[:marage_state_cd],
            marageTrmntnCityNm: options[:marage_trmntn_city_nm],
            marageTrmntnCntryNm: options[:marage_trmntn_cntry_nm],
            marageTrmntnStateCd: options[:marage_trmntn_state_cd],
            marageTrmntnTypeCd: options[:marage_trmntn_type_cd],
            mthlySupportFromVetAmt: options[:mthly_support_from_vet_amt],
            proofDepncyInd: options[:proof_depncy_ind],
            prptnlPhraseTypeNm: options[:prptnl_phrase_type_nm],
            ptcpntRlnshpTypeNm: options[:ptcpnt_rlnshp_type_nm],
            rateTypeNm: options[:rate_type_nm],
            reviewDt: options[:review_dt],
            statusTypeCd: options[:status_type_cd],
            tempCustdnInd: options[:temp_custdn_ind],
            poaRepNm: options[:poa_rep_nm],
            poaRepTitleTxt: options[:poa_rep_title_txt],
            poaSigntrVrfctnDt: options[:poa_signtr_vrfctn_dt],
            poaRepTypeCd: options[:poa_rep_type_cd],
            poaAgencyNm: options[:poa_agency_nm],
            vnpProcId: options[:vnp_proc_id],
            vnpPtcpntIdA: options[:vnp_ptcpnt_id_a],
            vnpPtcpntIdB: options[:vnp_ptcpnt_id_b]
          }
        },
        options[:ssn]
      )

      response.body[:vnp_ptcpnt_rlnshp_create_response][:return]
    end

    private

    def vnp_ptcpnt_rlnshp_create_required_fields
      %i[
        vnp_proc_id
        jrn_dt
        jrn_lctn_id
        jrn_obj_id
        jrn_status_type_cd
        jrn_user_id
        vnp_ptcpnt_id_a
        vnp_ptcpnt_id_b
        ptcpnt_rlnshp_type_nm
      ]
    end
  end
end
