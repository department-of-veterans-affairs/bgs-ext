module LighthouseBGS
  class VnpPtcpntRlnshpService < LighthouseBGS::Base
    def bean_name
      'VnpPtcpntRlnshpWebServiceBean'
    end

    def self.service_name
      'vnp_ptcpnt_rlnshp'
    end

    def vnp_ptcpnt_rlnshp_create(
      vnp_proc_id:,
      jrn_dt:,
      jrn_lctn_id:,
      jrn_obj_id:,
      jrn_status_type_cd:,
      jrn_user_id:,
      vnp_ptcpnt_id_a:,
      vnp_ptcpnt_id_b:,
      ptcpnt_rlnshp_type_nm:,
      vnp_ptcpnt_rlnshp_id: nil,
      begin_dt: nil,
      child_prevly_married_ind: nil,
      end_dt: nil,
      event_dt: nil,
      family_rlnshp_type_nm: nil,
      fid_attntn_txt: nil,
      hlthcr_prvdr_rlse_ind: nil,
      lives_with_relatd_person_ind: nil,
      marage_city_nm: nil,
      marage_cntry_nm: nil,
      marage_state_cd: nil,
      marage_trmntn_city_nm: nil,
      marage_trmntn_cntry_nm: nil,
      marage_trmntn_state_cd: nil,
      marage_trmntn_type_cd: nil,
      mthly_support_from_vet_amt: nil,
      proof_depncy_ind: nil,
      prptnl_phrase_type_nm: nil,
      rate_type_nm: nil,
      review_dt: nil,
      status_type_cd: nil,
      temp_custdn_ind: nil,
      poa_rep_nm: nil,
      poa_rep_title_txt: nil,
      poa_signtr_vrfctn_dt: nil,
      poa_rep_type_cd: nil,
      poa_agency_nm: nil,
      ssn: nil # Just here to make mocks work
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
