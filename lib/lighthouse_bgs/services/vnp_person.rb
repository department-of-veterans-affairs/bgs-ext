module LighthouseBGS
  class VnpPersonService < LighthouseBGS::Base
    def bean_name
      'VnpPersonServiceBean'
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
      frgn_svc_nbr:,
      gender_cd:,
      jrn_dt:,
      jrn_lctn_id:,
      jrn_obj_id:,
      jrn_status_type_cd:,
      jrn_user_id:,
      last_nm:,
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
            "vnp_ptcpnt_id": vnp_ptcpnt_id,
            "birth_city_nm": birth_city_nm,
            "birth_state_cd": birth_state_cd,
            "birth_cntry_nm": birth_cntry_nm,
            "cmptny_decn_type_cd": cmptny_decn_type_cd,
            "dep_nbr": dep_nbr,
            "emp_ind": emp_ind,
            "entlmt_type_cd": entlmt_type_cd,
            "ethnic_type_cd": ethnic_type_cd,
            "ever_maried_ind": ever_maried_ind,
            "fid_decn_categy_type_cd": fid_decn_categy_type_cd,
            "file_nbr": file_nbr,
            "first_nm": first_nm,
            "frgn_svc_nbr": frgn_svc_nbr,
            "gender_cd": gender_cd,
            "jrn_dt": jrn_dt,
            "jrn_lctn_id": jrn_lctn_id,
            "jrn_obj_id": jrn_obj_id,
            "jrn_status_type_cd": jrn_status_type_cd,
            "jrn_user_id": jrn_user_id,
            "last_nm": last_nm,
            "lgy_entlmt_type_cd": lgy_entlmt_type_cd,
            "martl_status_type_cd": martl_status_type_cd,
            "middle_nm": middle_nm,
            "mlty_person_ind": mlty_person_ind,
            "months_presnt_emplyr_nbr": months_presnt_emplyr_nbr,
            "net_worth_amt": net_worth_amt,
            "no_ssn_reason_type_cd": no_ssn_reason_type_cd,
            "ocptn_txt": ocptn_txt,
            "person_death_cause_type_nm": person_death_cause_type_nm,
            "person_type_nm": person_type_nm,
            "potntl_dngrs_ind": potntl_dngrs_ind,
            "race_type_nm": race_type_nm,
            "serous_emplmt_hndcap_ind": serous_emplmt_hndcap_ind,
            "slttn_type_nm": slttn_type_nm,
            "spina_bifida_ind": spina_bifida_ind,
            "ssn_nbr": ssn_nbr,
            "ssn_vrfctn_status_type_cd": ssn_vrfctn_status_type_cd,
            "suffix_nm": suffix_nm,
            "tax_abtmnt_cd": tax_abtmnt_cd,
            "termnl_digit_nbr": termnl_digit_nbr,
            "title_txt": title_txt,
            "vet_ind": vet_ind,
            "vet_type_nm": vet_type_nm,
            "years_presnt_emplyr_nbr": years_presnt_emplyr_nbr,
            "vnp_proc_id": vnp_proc_id,
            "vnp_srusly_dsabld_ind": vnp_srusly_dsabld_ind,
            "vnp_school_child_ind": vnp_school_child_ind,
          }
        },
        ssn
      )

      response.body[:vnp_person_create_response][:return]
    end
  end
end
