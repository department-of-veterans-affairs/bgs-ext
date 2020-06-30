# frozen_string_literal: true

# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.

module BGS
  class VnpChildStudentService < BGS::Base
    def bean_name
      'VnpChildStudentWebServiceBean'
    end

    def self.service_name
      'vnp_child_student'
    end

    def child_student_create(options)
    validate_required_keys(child_student_create_required_fields, options, __method__.to_s)

      response = request(
        :vnp_child_student_create,
        {
          "arg0": {
            "vnpProcId": options[:vnp_proc_id],
            "vnpPtcpntId": options[:vnp_ptcpnt_id],
            "jrnDt": options[:jrn_dt],
            "jrnLctnId": options[:jrn_lctn_id],
            "jrnObjId": options[:jrn_obj_id],
            "jrnStatusTypeCd": options[:jrn_status_type_cd],
            "jrnUserId": options[:jrn_user_id],
            "agencyPayingTuitnNm": options[:agency_paying_tuitn_nm],
            "govtPaidTuitnInd": options[:govt_paid_tuitn_ind],
            "govtPaidTuitnStartDt": options[:govt_paid_tuitn_start_dt],
            "marageDt": options[:marage_dt],
            "nextYearAnntyIncomeAmt": options[:next_year_annty_income_amt],
            "nextYearEmplmtIncomeAmt": options[:next_year_emplmt_income_amt],
            "nextYearOtherIncomeAmt": options[:next_year_other_income_amt],
            "nextYearSsaIncomeAmt": options[:next_year_ssa_income_amt],
            "otherAssetAmt": options[:other_asset_amt],
            "realEstateAmt": options[:real_estate_amt],
            "rmks": options[:rmks],
            "savingAmt": options[:saving_amt],
            "stockBondAmt": options[:stock_bond_amt],
            "termYearAnntyIncomeAmt": options[:term_year_annty_income_amt],
            "termYearEmplmtIncomeAmt": options[:term_year_emplmt_income_amt],
            "termYearOtherIncomeAmt": options[:term_year_other_income_amt],
            "termYearSsaIncomeAmt": options[:term_year_ssa_income_amt]
          }
        },
        options[:ssn]
      )

      response.body[:vnp_child_student_create_response][:return]
    end

    private

    def child_student_create_required_fields
      %i[
        vnp_proc_id
        vnp_ptcpnt_id
        jrn_dt
        jrn_lctn_id
        jrn_obj_id
        jrn_status_type_cd
        jrn_user_id
      ]
    end
  end
end
