module LighthouseBGS
  class VnpChildSchoolService < LighthouseBGS::Base
    def bean_name
      'VnpChildSchoolWebServiceBean'
    end

    def self.service_name
      'vnp_child_school'
    end

    def child_school_create(
      vnp_proc_id:,
      vnp_ptcpnt_id:,
      jrn_dt:,
      jrn_lctn_id:,
      jrn_obj_id:,
      jrn_status_type_cd:,
      jrn_user_id:,
      gradtn_dt:,
      vnp_child_school_id: nil,
      course_name_txt: nil,
      curnt_hours_per_wk_num: nil,
      curnt_school_addrs_one_txt: nil,
      curnt_school_addrs_two_txt: nil,
      curnt_school_addrs_three_txt: nil,
      curnt_school_addrs_zip_nbr: nil,
      curnt_school_nm: nil,
      curnt_school_postal_cd: nil,
      curnt_sessns_per_wk_num: nil,
      current_edu_instn_ptcpnt_id: nil,
      full_time_studnt_type_cd: nil,
      last_term_end_dt: nil,
      last_term_enrlmt_ind: nil,
      last_term_start_dt: nil,
      part_time_school_subjct_txt: nil,
      prev_hours_per_wk_num: nil,
      prev_school_addrs_one_txt: nil,
      prev_school_addrs_two_txt: nil,
      prev_school_addrs_three_txt: nil,
      prev_school_addrs_zip_nbr: nil,
      prev_school_nm: nil,
      prev_school_postal_cd: nil,
      prev_sessns_per_wk_num: nil,
      rmks: nil,
      school_actual_expctd_start_dt: nil,
      school_term_start_dt: nil,
      prev_edu_instn_ptcpnt_id: nil,
      prev_school_city_nm: nil,
      prev_school_cntry_nm: nil,
      curnt_school_city_nm: nil,
      curnt_school_cntry_nm: nil,
      prev_mlty_postal_typ_cd: nil,
      prev_mlty_post_office_typ_cd: nil,
      prev_frgn_postal_cd: nil,
      curnt_mlty_postal_typ_cd: nil,
      curnt_mlty_post_office_typ_cd: nil,
      curnt_forgn_postal_cd: nil,
      ssn: # Just here to make the mocks work
    )

      response = request(
        :vnp_child_school_create,
        {
          "arg0": {
            "vnpChildSchoolId": vnp_child_school_id,
            "courseNameTxt": course_name_txt,
            "curntHoursPerWkNum": curnt_hours_per_wk_num,
            "curntSchoolAddrsOneTxt": curnt_school_addrs_one_txt,
            "curntSchoolAddrsTwoTxt": curnt_school_addrs_two_txt,
            "curntSchoolAddrsThreeTxt": curnt_school_addrs_three_txt,
            "curntSchoolAddrsZipNbr": curnt_school_addrs_zip_nbr,
            "curntSchoolNm": curnt_school_nm,
            "curntSchoolPostalCd": curnt_school_postal_cd,
            "curntSessnsPerWkNum": curnt_sessns_per_wk_num,
            "currentEduInstnPtcpntId": current_edu_instn_ptcpnt_id,
            "fullTimeStudntTypeCd": full_time_studnt_type_cd,
            "gradtnDt": gradtn_dt,
            "jrnDt": jrn_dt,
            "jrnLctnId": jrn_lctn_id,
            "jrnObjId": jrn_obj_id,
            "jrnStatusTypeCd": jrn_status_type_cd,
            "jrnUserId": jrn_user_id,
            "lastTermEndDt": last_term_end_dt,
            "lastTermEnrlmtInd": last_term_enrlmt_ind,
            "lastTermStartDt": last_term_start_dt,
            "partTimeSchoolSubjctTxt": part_time_school_subjct_txt,
            "prevHoursPerWkNum": prev_hours_per_wk_num,
            "prevSchoolAddrsOneTxt": prev_school_addrs_one_txt,
            "prevSchoolAddrsTwoTxt": prev_school_addrs_two_txt,
            "prevSchoolAddrsThreeTxt": prev_school_addrs_three_txt,
            "prevSchoolAddrsZipNbr": prev_school_addrs_zip_nbr,
            "prevSchoolNm": prev_school_nm,
            "prevSchoolPostalCd": prev_school_postal_cd,
            "prevSessnsPerWkNum": prev_sessns_per_wk_num,
            "rmks": rmks,
            "schoolActualExpctdStartDt": school_actual_expctd_start_dt,
            "schoolTermStartDt": school_term_start_dt,
            "vnpPtcpntId": vnp_ptcpnt_id,
            "vnpProcId": vnp_proc_id,
            "prevEduInstnPtcpntId": prev_edu_instn_ptcpnt_id,
            "prevSchoolCityNm": prev_school_city_nm,
            "prevSchoolCntryNm": prev_school_cntry_nm,
            "curntSchoolCityNm": curnt_school_city_nm,
            "curntSchoolCntryNm": curnt_school_cntry_nm,
            "prevMltyPostalTypCd": prev_mlty_postal_typ_cd,
            "prevMltyPostOfficeTypCd": prev_mlty_post_office_typ_cd,
            "prevFrgnPostalCd": prev_frgn_postal_cd,
            "curntMltyPostalTypCd": curnt_mlty_postal_typ_cd,
            "curntMltyPostOfficeTypCd": curnt_mlty_post_office_typ_cd,
            "curntForgnPostalCd": curnt_forgn_postal_cd,
          }
        },
        ssn
      )

      response.body[:vnp_child_school_create_response][:return]
    end
  end
end
