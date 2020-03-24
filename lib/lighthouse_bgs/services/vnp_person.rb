module LighthouseBGS
  class VnpPersonService < LighthouseBGS::Base
    def bean_name
      'VnpPersonWebServiceBean'
    end

    def self.service_name
      'vnp_person'
    end

    def vnp_person_create(
      vnp_ptcpnt_id:,
      birth_city_nm:,
      birth_state_cd:,
      birth_cntry_nm:,
      cmptny_decn_type_cd:,
      dep_nbr:,
      emp_ind:,
      entlmt_type_cd:,
      ethnic_type_cd:,
      ever_maried_ind:,
      fid_decn_categy_type_cd:,
      file_nbr:,
      first_nm:,
      first_nm_key:,
      frgn_svc_nbr:,
      gender_cd:,
      jrn_dt:,
      jrn_lctn_id:,
      jrn_obj_id:,
      jrn_status_type_cd:,
      jrn_user_id:,
      last_nm:,
      last_nm_key:,
      lgy_entlmt_type_cd:,
      martl_status_type_cd:,
      middle_nm:,
      mlty_person_ind:,
      months_presnt_emplyr_nbr:,
      net_worth_amt:,
      no_ssn_reason_type_cd:,
      ocptn_txt:,
      person_death_cause_type_nm:,
      person_type_nm:,
      potntl_dngrs_ind:,
      race_type_nm:,
      serous_emplmt_hndcap_ind:,
      slttn_type_nm:,
      spina_bifida_ind:,
      ssn_nbr:,
      ssn_vrfctn_status_type_cd:,
      suffix_nm:,
      tax_abtmnt_cd:,
      termnl_digit_nbr:,
      title_txt:,
      vet_ind:,
      vet_type_nm:,
      years_presnt_emplyr_nbr:,
      vnp_proc_id:,
      vnp_srusly_dsabld_ind:,
      vnp_school_child_ind:,
      ssn: current_user.ssn
    )

      response = request(
        :vnp_person_create,
        {
          "arg0": {
            "vnpPtcpntId": vnp_ptcpnt_id,
            "birthCityNm": birth_city_nm,
            "birthStateCd": birth_state_cd,
            "birthCntryNm": birth_cntry_nm,
            "cmptnyDecnTypeCd": cmptny_decn_type_cd,
            "depNbr": dep_nbr,
            "empInd": emp_ind,
            "entlmtTypeCd": entlmt_type_cd,
            "ethnicTypeCd": ethnic_type_cd,
            "everMariedInd": ever_maried_ind,
            "fidDecnCategyTypeCd": fid_decn_categy_type_cd,
            "fileNbr": file_nbr,
            "firstNm": first_nm,
            "firstNmKey": first_nm_key,
            "frgnSvcNbr": frgn_svc_nbr,
            "genderCd": gender_cd,
            "jrnDt": jrn_dt,
            "jrnLctnId": jrn_lctn_id,
            "jrnObjId": jrn_obj_id,
            "jrnStatusTypeCd": jrn_status_type_cd,
            "jrnSserId": jrn_user_id,
            "lastNm": last_nm,
            "lastNmKey": last_nm_key,
            "lgyEntlmtTypeCd": lgy_entlmt_type_cd,
            "martlStatusTypeCd": martl_status_type_cd,
            "middleNm": middle_nm,
            "mltyPersonInd": mlty_person_ind,
            "monthsPresntEmplyrNbr": months_presnt_emplyr_nbr,
            "netWorthAmt": net_worth_amt,
            "noSsnReasonTypeCd": no_ssn_reason_type_cd,
            "ocptnTxt": ocptn_txt,
            "personDeathCauseTypeNm": person_death_cause_type_nm,
            "personTypeNm": person_type_nm,
            "potntlDngrsInd": potntl_dngrs_ind,
            "raceTypeNm": race_type_nm,
            "serousEmplmtHndcapInd": serous_emplmt_hndcap_ind,
            "slttnTypeNm": slttn_type_nm,
            "spinaBifidaInd": spina_bifida_ind,
            "ssnNbr": ssn_nbr,
            "ssnVrfctnStatusTypeCd": ssn_vrfctn_status_type_cd,
            "suffixNm": suffix_nm,
            "taxAbtmntCd": tax_abtmnt_cd,
            "termnlDigitNbr": termnl_digit_nbr,
            "titleTxt": title_txt,
            "vetInd": vet_ind,
            "vetTypeNm": vet_type_nm,
            "yearsPresntEmplyrNbr": years_presnt_emplyr_nbr,
            "vnpProcId": vnp_proc_id,
            "vnpSruslyDsabldInd": vnp_srusly_dsabld_ind,
            "vnpSchoolChildInd": vnp_school_child_ind,
          }
        },
        ssn
      )

      response.body[:vnp_person_create_response][:return]
    end
  end
end
