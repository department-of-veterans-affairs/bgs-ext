# frozen_string_literal: true

# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.

module LighthouseBGS
  class VnpProcServiceV2 < LighthouseBGS::Base
    def bean_name
      'VnpProcWebServiceBeanV2'
    end

    def self.service_name
      'vnp_proc_v2'
    end

    # VnpProcFindByPrimaryKey
    #   finds the vnpProc by vnpProcId
    def vnp_proc_find_by_primary_key(vnp_proc_id)
      response = request(:vnp_proc_find_by_primary_key, "vnpProcId": vnp_proc_id)
      response = response.body[:vnp_proc_find_by_primary_key_response][:return]
    end

    # create a new vnpProc
    def vnp_proc_create(
      jrn_dt:,
      jrn_lctn_id:,
      jrn_status_type_cd:,
      jrn_user_id:,
      jrn_obj_id:,
      vnp_proc_id: nil,
      vnp_proc_type_cd: nil,
      vnp_proc_state_type_cd: nil,
      creatd_dt: nil,
      last_modifd_dt: nil,
      submtd_dt: nil,
      applcn_form_exprtn_dt: nil,
      ssn: nil # just here to make the mocks work
      )

      response = request(
        :vnp_proc_create,
        {
          "arg0": {
            "vnpProcId": vnp_proc_id,
            "vnpProcTypeCd": vnp_proc_type_cd,
            "vnpProcStateTypeCd": vnp_proc_state_type_cd,
            "creatdDt": creatd_dt,
            "lastModifdDt": last_modifd_dt,
            "jrnDt": jrn_dt,
            "jrnLctnId": jrn_lctn_id,
            "jrnStatusTypeCd": jrn_status_type_cd,
            "jrnUserId": jrn_user_id,
            "jrnObjId": jrn_obj_id,
            "submtdDt": submtd_dt,
            "applcnFormExprtnDt": applcn_form_exprtn_dt
          }
        },
        ssn
      )
      response.body[:vnp_proc_create_response][:return]
    end

    def vnp_proc_update(
      vnp_proc_id:,
      jrn_dt:,
      jrn_lctn_id:,
      jrn_obj_id:,
      jrn_status_type_cd:,
      jrn_user_id:,
      vnp_proc_type_cd: nil,
      vnp_proc_state_type_cd: nil,
      creatd_dt: nil,
      last_modifd_dt: nil,
      submtd_dt: nil,
      applcn_form_exprtn_dt: nil,
      ssn: nil # Just here to make mocks work
      )

      response = request(
        :vnp_proc_update,
        {
          "arg0": {
            "vnpProcId": vnp_proc_id,
            "jrnDt": jrn_dt,
            "jrnLctnId": jrn_lctn_id,
            "jrnObjId": jrn_obj_id,
            "jrnStatusTypeCd": jrn_status_type_cd,
            "jrnUserId": jrn_user_id,
            "creatdDt": creatd_dt,
            "lastModifdDt": last_modifd_dt,
            "submtdDt": submtd_dt,
            "applcnFormExprtnDt": applcn_form_exprtn_dt
          }
        },
        ssn
      )

      response.body[:vnp_bnft_claim_create_response][:return]
    end
  end
end
