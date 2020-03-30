module LighthouseBGS
  class VnpChildStudentService < LighthouseBGS::Base
    def bean_name
      'VnpChildStudentWebServiceBean'
    end

    def self.service_name
      'vnp_child_student'
    end

    def child_student_create(
      vnp_child_school_id:,
      course_name_txtame_txt:,
      curnt_hours_per_wk_num:,
      curnt_school_addrs_one_txt:,
      curnt_school_addrs_two_txt:,
      curnt_school_addrs_three_txt:,
      curnt_school_addrs_zip_nbr:,
      curnt_school_nm:,
      curnt_school_postal_cd:,
      curnt_sessns_per_wk_num:,
      current_edu_instn_ptcpnt_id:,
      full_time_studnt_type_cd:,
      gradtn_dt:,
      jrn_dt:,
      jrn_lctn_id:,
      jrn_obj_id:,
      jrn_status_type_cd:,
      jrn_user_id:,
      last_term_end_dt:,
      last_term_enrlmt_ind:,
      last_term_start_dt:,
      part_time_school_subjct_txt:,
      prev_hours_per_wk_num:,
      prev_school_addrs_one_txt:,
      prev_school_addrs_two_txt:,
      prev_school_addrs_three_txt:,
      prev_school_addrs_zip_nbr:,
      prev_school_nm:,
      prev_school_postal_cd:,
      prev_sessns_per_wk_num:,
      rmks:,
      school_actual_expctd_start_dt:,
      school_term_start_dt:,
      vnp_ptcpnt_id:,
      vnp_proc_id:,
      prev_edu_instn_ptcpnt_id:,
      prev_school_city_nm:,
      prev_school_cntry_nm:,
      curnt_school_city_nm:,
      curnt_school_cntry_nm:,
      prev_mlty_postal_typ_cd:,
      prev_mlty_post_office_typ_cd:,
      prev_frgn_postal_cd:,
      curnt_mlty_postal_typ_cd:,
      curnt_mlty_post_office_typ_cd:,
      curnt_forgn_postal_cd:,
      ssn:
    )

      response = request(
        :vnp_child_student_create,
        {
          "arg0": {
            "vnpChildSchoolId": vnp_child_school_id,
            "courseNameTxt": course_name_txtame_txt,
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
