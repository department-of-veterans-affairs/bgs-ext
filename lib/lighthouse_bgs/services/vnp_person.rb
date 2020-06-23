# frozen_string_literal: true

# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.

module LighthouseBGS
  class VnpPersonService < LighthouseBGS::Base
    def bean_name
      'VnpPersonWebServiceBean'
    end

    def self.service_name
      'vnp_person'
    end

    def vnp_person_create(options)
    validate_required_keys(vnp_person_create_required_fields, options, __method__.to_s)

      response = request(
        :vnp_person_create,
        {
          "arg0": {
            "vnpPtcpntId": options[:vnp_ptcpnt_id],
            "birthCityNm": options[:birth_city_nm],
            "birthStateCd": options[:birth_state_cd],
            "birthCntryNm": options[:birth_cntry_nm],
            "brthdyDt": options[:brthdy_dt],
            "cmptnyDecnTypeCd": options[:cmptny_decn_type_cd],
            "depNbr": options[:dep_nbr],
            "empInd": options[:emp_ind],
            "entlmtTypeCd": options[:entlmt_type_cd],
            "ethnicTypeCd": options[:ethnic_type_cd],
            "everMariedInd": options[:ever_maried_ind],
            "fidDecnCategyTypeCd": options[:fid_decn_categy_type_cd],
            "fileNbr": options[:file_nbr],
            "firstNm": options[:first_nm],
            "firstNmKey": options[:first_nm_key],
            "frgnSvcNbr": options[:frgn_svc_nbr],
            "genderCd": options[:gender_cd],
            "jrnDt": options[:jrn_dt],
            "jrnLctnId": options[:jrn_lctn_id],
            "jrnObjId": options[:jrn_obj_id],
            "jrnStatusTypeCd": options[:jrn_status_type_cd],
            "jrnSserId": options[:jrn_user_id],
            "lastNm": options[:last_nm],
            "lastNmKey": options[:last_nm_key],
            "lgyEntlmtTypeCd": options[:lgy_entlmt_type_cd],
            "martlStatusTypeCd": options[:martl_status_type_cd],
            "middleNm": options[:middle_nm],
            "mltyPersonInd": options[:mlty_person_ind],
            "monthsPresntEmplyrNbr": options[:months_presnt_emplyr_nbr],
            "netWorthAmt": options[:net_worth_amt],
            "noSsnReasonTypeCd": options[:no_ssn_reason_type_cd],
            "ocptnTxt": options[:ocptn_txt],
            "personDeathCauseTypeNm": options[:person_death_cause_type_nm],
            "personTypeNm": options[:person_type_nm],
            "potntlDngrsInd": options[:potntl_dngrs_ind],
            "raceTypeNm": options[:race_type_nm],
            "serousEmplmtHndcapInd": options[:serous_emplmt_hndcap_ind],
            "slttnTypeNm": options[:slttn_type_nm],
            "spinaBifidaInd": options[:spina_bifida_ind],
            "ssnNbr": options[:ssn_nbr],
            "ssnVrfctnStatusTypeCd": options[:ssn_vrfctn_status_type_cd],
            "suffixNm": options[:suffix_nm],
            "taxAbtmntCd": options[:tax_abtmnt_cd],
            "termnlDigitNbr": options[:termnl_digit_nbr],
            "titleTxt": options[:title_txt],
            "vetInd": options[:vet_ind],
            "vetTypeNm": options[:vet_type_nm],
            "yearsPresntEmplyrNbr": options[:years_presnt_emplyr_nbr],
            "vnpProcId": options[:vnp_proc_id],
            "vnpSruslyDsabldInd": options[:vnp_srusly_dsabld_ind],
            "vnpSchoolChildInd": options[:vnp_school_child_ind],
            "deathDt": options[:death_dt]
          }
        },
        options[:ssn]
      )

      response.body[:vnp_person_create_response][:return]
    end

    private

    def vnp_person_create_required_fields
      %i[
        vnp_proc_id
        vnp_ptcpnt_id
        jrn_dt
        jrn_lctn_id
        jrn_obj_id
        jrn_status_type_cd
        jrn_user_id
        first_nm
        last_nm
      ]
    end
  end
end
