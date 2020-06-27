# frozen_string_literal: true

# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.

module LighthouseBGS
  class VnpChildSchoolService < LighthouseBGS::Base
    def bean_name
      'VnpChildSchoolWebServiceBean'
    end

    def self.service_name
      'vnp_child_school'
    end

    def child_school_create(options)
      validate_required_keys(child_school_create_required_fields, options, __method__.to_s)

      response = request(
        :vnp_child_school_create,
        {
          "arg0": {
            "vnpChildSchoolId": options[:vnp_child_school_id],
            "courseNameTxt": options[:course_name_txt],
            "curntHoursPerWkNum": options[:curnt_hours_per_wk_num],
            "curntSchoolAddrsOneTxt": options[:curnt_school_addrs_one_txt],
            "curntSchoolAddrsTwoTxt": options[:curnt_school_addrs_two_txt],
            "curntSchoolAddrsThreeTxt": options[:curnt_school_addrs_three_txt],
            "curntSchoolAddrsZipNbr": options[:curnt_school_addrs_zip_nbr],
            "curntSchoolNm": options[:curnt_school_nm],
            "curntSchoolPostalCd": options[:curnt_school_postal_cd],
            "curntSessnsPerWkNum": options[:curnt_sessns_per_wk_num],
            "currentEduInstnPtcpntId": options[:current_edu_instn_ptcpnt_id],
            "fullTimeStudntTypeCd": options[:full_time_studnt_type_cd],
            "gradtnDt": options[:gradtn_dt],
            "jrnDt": options[:jrn_dt],
            "jrnLctnId": options[:jrn_lctn_id],
            "jrnObjId": options[:jrn_obj_id],
            "jrnStatusTypeCd": options[:jrn_status_type_cd],
            "jrnUserId": options[:jrn_user_id],
            "lastTermEndDt": options[:last_term_end_dt],
            "lastTermEnrlmtInd": options[:last_term_enrlmt_ind],
            "lastTermStartDt": options[:last_term_start_dt],
            "partTimeSchoolSubjctTxt": options[:part_time_school_subjct_txt],
            "prevHoursPerWkNum": options[:prev_hours_per_wk_num],
            "prevSchoolAddrsOneTxt": options[:prev_school_addrs_one_txt],
            "prevSchoolAddrsTwoTxt": options[:prev_school_addrs_two_txt],
            "prevSchoolAddrsThreeTxt": options[:prev_school_addrs_three_txt],
            "prevSchoolAddrsZipNbr": options[:prev_school_addrs_zip_nbr],
            "prevSchoolNm": options[:prev_school_nm],
            "prevSchoolPostalCd": options[:prev_school_postal_cd],
            "prevSessnsPerWkNum": options[:prev_sessns_per_wk_num],
            "rmks": options[:rmks],
            "schoolActualExpctdStartDt": options[:school_actual_expctd_start_dt],
            "schoolTermStartDt": options[:school_term_start_dt],
            "vnpPtcpntId": options[:vnp_ptcpnt_id],
            "vnpProcId": options[:vnp_proc_id],
            "prevEduInstnPtcpntId": options[:prev_edu_instn_ptcpnt_id],
            "prevSchoolCityNm": options[:prev_school_city_nm],
            "prevSchoolCntryNm": options[:prev_school_cntry_nm],
            "curntSchoolCityNm": options[:curnt_school_city_nm],
            "curntSchoolCntryNm": options[:curnt_school_cntry_nm],
            "prevMltyPostalTypCd": options[:prev_mlty_postal_typ_cd],
            "prevMltyPostOfficeTypCd": options[:prev_mlty_post_office_typ_cd],
            "prevFrgnPostalCd": options[:prev_frgn_postal_cd],
            "curntMltyPostalTypCd": options[:curnt_mlty_postal_typ_cd],
            "curntMltyPostOfficeTypCd": options[:curnt_mlty_post_office_typ_cd],
            "curntForgnPostalCd": options[:curnt_forgn_postal_cd]
          }
        },
        options[:ssn]
      )

      response.body[:vnp_child_school_create_response][:return]
    end

    private

    def child_school_create_required_fields
      %i[
        vnp_proc_id
        vnp_ptcpnt_id
        jrn_dt
        jrn_lctn_id
        jrn_obj_id
        jrn_status_type_cd
        jrn_user_id
        gradtn_dt
      ]
    end
  end
end
