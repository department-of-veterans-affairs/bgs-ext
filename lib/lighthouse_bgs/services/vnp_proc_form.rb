# frozen_string_literal: true

# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.

module LighthouseBGS
  class VnpProcFormService < LighthouseBGS::Base
    def bean_name
      'VnpProcFormWebServiceBean'
    end

    def self.service_name
      'vnp_proc_form'
    end

    def vnp_proc_form_find_by_primary_key(vnp_proc_id, form_type_cd)
      response = request(:vnp_proc_form_find_by_primary_key, { "vnpProcId": vnp_proc_id, "formTypeCd": form_type_cd })
      response = response.body[:vnp_proc_form_find_by_primary_key_response][:return]
    end

    def vnp_proc_form_create(vnp_proc_id:, form_type_cd:, jrn_dt:, jrn_lctn_id:, jrn_obj_id:, jrn_status_type_cd:, jrn_user_id:, ssn:)
      response = request(
        :vnp_proc_form_create,
        {
          "arg0": {
            "compId": {
              "vnpProcId": vnp_proc_id,
              "formTypeCd": form_type_cd
            },
            "jrnDt": jrn_dt,
            "jrnLctnId": jrn_lctn_id,
            "jrnObjId": jrn_obj_id,
            "jrnStatusTypeCd": jrn_status_type_cd,
            "jrnUserId": jrn_user_id
          }
        },
        ssn
      )
      response.body[:vnp_proc_form_create_response][:return]
    end
  end
end
