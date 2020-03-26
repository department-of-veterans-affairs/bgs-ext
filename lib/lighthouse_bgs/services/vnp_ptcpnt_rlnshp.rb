module LighthouseBGS
  class VnpPtcpntRlnshpService < LighthouseBGS::Base
    def bean_name
      'VnpPtcpntRlnshpWebServiceBean'
    end

    def self.service_name
      'vnp_ptcpnt_rlnshp'
    end

    def vnp_ptcpnt_rlnshp_create(
      vnp_ptcpnt_rlnshp_id:,
      begin_dt:,
      child_prevly_married_ind:,
      end_dt:,
      event_dt:,
      family_rlnshp_type_nm:,
      fid_attntn_txt:,
      hlthcr_prvdr_rlse_ind:,
      jrn_dt:,
      jrn_lctn_id:,
      jrn_obj_id:,
      jrn_status_type_cd:,
      jrn_user_id:,
      lives_with_relatd_person_ind:,
      marage_city_nm:,
      marage_cntry_nm:,
      marage_state_cd:,
      marage_trmntn_city_nm:,
      marage_trmntn_cntry_nm:,
      marage_trmntn_state_cd:,
      marage_trmntn_type_cd:,
      mthly_support_from_vet_amt:,
      proof_depncy_ind:,
      prptnl_phrase_type_nm:,
      ptcpnt_rlnshp_type_nm:,
      rate_type_nm:,
      review_dt:,
      status_type_cd:,
      temp_custdn_ind:,
      poa_rep_nm:,
      poa_rep_title_txt:,
      poa_signtr_vrfctn_dt:,
      poa_rep_type_cd:,
      poa_agency_nm:,
      vnp_proc_id:,
      vnp_ptcpnt_id_a:,
      vnp_ptcpnt_id_b:,
      ssn:
    )

      response = request(
        :vnp_ptcpnt_rlnshp_create,
        {
          "arg0": {
            vnpPtcpntRlnshpId: vnp_ptcpnt_rlnshp_id,
            beginDt: begin_dt,
            childPrevlyMarriedInd: child_prevly_married_ind,
            endDt: end_dt,
            eventDt: event_dt,
            familyRlnshpTypeNm: family_rlnshp_type_nm,
            fidAttntnTxt: fid_attntn_txt,
            hlthcrPrvdrRlseInd: hlthcr_prvdr_rlse_ind,
            jrnDt: jrn_dt,
            jrnLctnId: jrn_lctn_id,
            jrnObjId: jrn_obj_id,
            jrnStatusTypeCd: jrn_status_type_cd,
            jrnUserId: jrn_user_id,
            livesWithRelatdPersonInd: lives_with_relatd_person_ind,
            marageCityNm: marage_city_nm,
            marageCntryNm: marage_cntry_nm,
            marageStateCd: marage_state_cd,
            marageTrmntnCityNm: marage_trmntn_city_nm,
            marageTrmntnCntryNm: marage_trmntn_cntry_nm,
            marageTrmntnStateCd: marage_trmntn_state_cd,
            marageTrmntnTypeCd: marage_trmntn_type_cd,
            mthlySupportFromVetAmt: mthly_support_from_vet_amt,
            proofDepncyInd: proof_depncy_ind,
            prptnlPhraseTypeNm: prptnl_phrase_type_nm,
            ptcpntRlnshpTypeNm: ptcpnt_rlnshp_type_nm,
            rateTypeNm: rate_type_nm,
            reviewDt: review_dt,
            statusTypeCd: status_type_cd,
            tempCustdnInd: temp_custdn_ind,
            poaRepNm: poa_rep_nm,
            poaRepTitleTxt: poa_rep_title_txt,
            poaSigntrVrfctnDt: poa_signtr_vrfctn_dt,
            poaRepTypeCd: poa_rep_type_cd,
            poaAgencyNm: poa_agency_nm,
            vnpProcId: vnp_proc_id,
            vnpPtcpntIdA: vnp_ptcpnt_id_a,
            vnpPtcpntIdB: vnp_ptcpnt_id_b
          }
        },
        ssn
      )

      response.body[:vnp_ptcpnt_rlnshp_create_response][:return]
    end
  end
end
