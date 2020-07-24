# frozen_string_literal: true

# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.

module BGS
  class VnpPersonService < BGS::Base
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
          'arg0': options.transform_keys { |key| StringUtils.camelize(key.to_s, :lower) }
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
