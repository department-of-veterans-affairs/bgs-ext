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
          'arg0': options.transform_keys { |key| key.to_s.camelcase(:lower) }
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
