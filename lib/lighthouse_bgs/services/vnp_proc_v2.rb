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
      #vnp_proc_id:,
      vnp_proc_type_cd:, vnp_proc_state_type_cd:, creatd_dt:, last_modifd_dt:,
      jrn_dt:, jrn_lctn_id:, jrn_status_type_cd:, jrn_user_id:, jrn_obj_id:, submtd_dt:#, applcn_form_exprtn_dt:
      )
      response = request(
        :vnp_proc_create,
        "arg0": {
          #"vnpProcId": vnp_proc_id,
          "vnpProcTypeCd": vnp_proc_type_cd,
          "vnpProcStateTypeCd": vnp_proc_state_type_cd,
          "creatdDt": creatd_dt,
          "lastModifdDt": last_modifd_dt,
          "jrnDt": jrn_dt,
          "jrnLctnId": jrn_lctn_id,
          "jrnStatusTypeCd": jrn_status_type_cd,
          "jrnUserId": jrn_user_id,
          "jrnObjId": jrn_obj_id,
          "submtdDt": submtd_dt
          #"applcnFormExprtnDt": applcn_form_exprtn_dt
        }
      )
      response.body[:vnp_proc_create_response][:return]
    end
  end
end
