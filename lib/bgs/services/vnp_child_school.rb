# frozen_string_literal: true

# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.

module BGS
  class VnpChildSchoolService < BGS::Base
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
          arg0: options.transform_keys { |key| StringUtils.camelize(key, :lower) }
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
