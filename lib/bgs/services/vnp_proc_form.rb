# frozen_string_literal: true

# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.

module BGS
  class VnpProcFormService < BGS::Base
    def bean_name
      'VnpProcFormWebServiceBean'
    end

    def self.service_name
      'vnp_proc_form'
    end

    def vnp_proc_form_find_by_primary_key(vnp_proc_id, form_type_cd)
      response = request(:vnp_proc_form_find_by_primary_key, { "vnpProcId": vnp_proc_id, "formTypeCd": form_type_cd })
      response.body[:vnp_proc_form_find_by_primary_key_response][:return]
    end

    def vnp_proc_form_create(options)
      validate_required_keys(vnp_proc_form_create_required_fields, options, __method__.to_s)

      response = request(
        :vnp_proc_form_create,
        {
          "arg0": {
            "compId": {
              "vnpProcId": options[:vnp_proc_id],
              "formTypeCd": options[:form_type_cd]
            },
            "jrnDt": options[:jrn_dt],
            "jrnLctnId": options[:jrn_lctn_id],
            "jrnObjId": options[:jrn_obj_id],
            "jrnStatusTypeCd": options[:jrn_status_type_cd],
            "jrnUserId": options[:jrn_user_id]
          }
        },
        options[:ssn]
      )
      response.body[:vnp_proc_form_create_response][:return]
    end

    private

    def vnp_proc_form_create_required_fields
      %i[
        vnp_proc_id
        form_type_cd
        jrn_dt
        jrn_lctn_id
        jrn_obj_id
        jrn_status_type_cd
        jrn_user_id
      ]
    end
  end
end
