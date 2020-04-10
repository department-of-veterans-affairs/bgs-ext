module LighthouseBGS
  class VnpChildStudentService < LighthouseBGS::Base
    def bean_name
      'VnpChildStudentWebServiceBean'
    end

    def self.service_name
      'vnp_child_student'
    end

    def child_student_create(
      vnp_proc_id:,
      vnp_ptcpnt_id:,
      jrn_dt:,
      jrn_lctn_id:,
      jrn_obj_id:,
      jrn_status_type_cd:,
      jrn_user_id:,
      agency_paying_tuitn_nm: nil,
      govt_paid_tuitn_ind: nil,
      govt_paid_tuitn_start_dt: nil,
      marage_dt: nil,
      next_year_annty_income_amt: nil,
      next_year_emplmt_income_amt: nil,
      next_year_other_income_amt: nil,
      next_year_ssa_income_amt: nil,
      other_asset_amt: nil,
      real_estate_amt: nil,
      rmks: nil,
      saving_amt: nil,
      stock_bond_amt: nil,
      term_year_annty_income_amt: nil,
      term_year_emplmt_income_amt: nil,
      term_year_other_income_amt: nil,
      term_year_ssa_income_amt: nil,
      ssn: nil # Just here to make the mocks work
    )

      response = request(
        :vnp_child_student_create,
        {
          "arg0": {
            "vnpProcId": vnp_proc_id,
            "vnpPtcpntId": vnp_ptcpnt_id,
            "jrnDt": jrn_dt,
            "jrnLctnId": jrn_lctn_id,
            "jrnObjId": jrn_obj_id,
            "jrnStatusTypeCd": jrn_status_type_cd,
            "jrnUserId": jrn_user_id,
            "agencyPayingTuitnNm": agency_paying_tuitn_nm,
            "govtPaidTuitnInd": govt_paid_tuitn_ind,
            "govtPaidTuitnStartDt": govt_paid_tuitn_start_dt,
            "marageDt": marage_dt,
            "nextYearAnntyIncomeAmt": next_year_annty_income_amt,
            "nextYearEmplmtIncomeAmt": next_year_emplmt_income_amt,
            "nextYearOtherIncomeAmt": next_year_other_income_amt,
            "nextYearSsaIncomeAmt": next_year_ssa_income_amt,
            "otherAssetAmt": other_asset_amt,
            "realEstateAmt": real_estate_amt,
            "rmks": rmks,
            "savingAmt": saving_amt,
            "stockBondAmt": stock_bond_amt,
            "termYearAnntyIncomeAmt": term_year_annty_income_amt,
            "termYearEmplmtIncomeAmt": term_year_emplmt_income_amt,
            "termYearOtherIncomeAmt": term_year_other_income_amt,
            "termYearSsaIncomeAmt": term_year_ssa_income_amt
          }
        },
        ssn
      )

      response.body[:vnp_child_student_create_response][:return]
    end
  end
end
