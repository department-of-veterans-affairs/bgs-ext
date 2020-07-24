# frozen_string_literal: true

# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.

module BGS
  class VnpPtcpntPhoneService < BGS::Base
    def bean_name
      'VnpPtcpntPhoneWebServiceBean'
    end

    def self.service_name
      'vnp_ptcpnt_phone'
    end

    def vnp_ptcpnt_phone_create(options)
      validate_required_keys(vnp_ptcpnt_phone_create_required_fields, options, __method__.to_s)

      response = request(
        :vnp_ptcpnt_phone_create,
        {
          'arg0': options.transform_keys { |key| StringUtils.camelize(key, :lower) }
        },
        options[:ssn]
      )

      response.body[:vnp_ptcpnt_phone_create_response][:return]
    end

    private

    def vnp_ptcpnt_phone_create_required_fields
      %i[
        vnp_proc_id
        jrn_dt
        jrn_lctn_id
        jrn_user_id
        jrn_status_type_cd
        jrn_obj_id
        vnp_ptcpnt_id
        phone_type_nm
        phone_nbr
        efctv_dt
      ]
    end
  end
end
