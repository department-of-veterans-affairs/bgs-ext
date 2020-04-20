module LighthouseBGS
  class VnpPersonService < LighthouseBGS::Base
    def bean_name
      'VnpPersonWebServiceBean'
    end

    def self.service_name
      'vnp_person'
    end

    def vnp_person_create(
      vnp_proc_id:,
      vnp_ptcpnt_id:,
      jrn_dt:,
      jrn_lctn_id:,
      jrn_obj_id:,
      jrn_status_type_cd:,
      jrn_user_id:,
      first_nm:,
      last_nm:,
      birth_city_nm: nil,
      birth_state_cd: nil,
      birth_cntry_nm: nil,
      brthdy_dt: nil,
      cmptny_decn_type_cd: nil,
      dep_nbr: nil,
      emp_ind: nil,
      entlmt_type_cd: nil,
      ethnic_type_cd: nil,
      ever_maried_ind: nil,
      fid_decn_categy_type_cd: nil,
      file_nbr: nil,
      first_nm_key: nil,
      frgn_svc_nbr: nil,
      gender_cd: nil,
      last_nm_key: nil,
      lgy_entlmt_type_cd: nil,
      martl_status_type_cd: nil,
      middle_nm: nil,
      mlty_person_ind: nil,
      months_presnt_emplyr_nbr: nil,
      net_worth_amt: nil,
      no_ssn_reason_type_cd: nil,
      ocptn_txt: nil,
      person_death_cause_type_nm: nil,
      person_type_nm: nil,
      potntl_dngrs_ind: nil,
      race_type_nm: nil,
      serous_emplmt_hndcap_ind: nil,
      slttn_type_nm: nil,
      spina_bifida_ind: nil,
      ssn_nbr: nil,
      ssn_vrfctn_status_type_cd: nil,
      suffix_nm: nil,
      tax_abtmnt_cd: nil,
      termnl_digit_nbr: nil,
      title_txt: nil,
      vet_ind: nil,
      vet_type_nm: nil,
      years_presnt_emplyr_nbr: nil,
      vnp_srusly_dsabld_ind: nil,
      vnp_school_child_ind: nil,
      death_dt: nil,
      ssn: # Just here to make mocks work
    )

      response = request(
        :vnp_person_create,
        {
          "arg0": {
            "vnpPtcpntId": vnp_ptcpnt_id,
            "birthCityNm": birth_city_nm,
            "birthStateCd": birth_state_cd,
            "birthCntryNm": birth_cntry_nm,
            "brthdyDt": brthdy_dt,
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
            "deathDt": death_dt
          }
        },
        ssn
      )

      response.body[:vnp_person_create_response][:return]
    end
  end
end
