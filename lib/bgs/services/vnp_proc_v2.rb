# frozen_string_literal: true

# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.

require_relative('../../string.rb')

module BGS
  class VnpProcServiceV2 < BGS::Base
    def bean_name
      'VnpProcWebServiceBeanV2'
    end

    def self.service_name
      'vnp_proc_v2'
    end

    def vnp_proc_find_by_primary_key(vnp_proc_id)
      response = request(:vnp_proc_find_by_primary_key, "vnpProcId": vnp_proc_id)
      response = response.body[:vnp_proc_find_by_primary_key_response][:return]
    end

    def vnp_proc_create(options)
      validate_required_keys(vnp_proc_create_required_fields, options, __method__.to_s)

      response = request(
        :vnp_proc_create,
        {
          'arg0': options.transform_keys { |key| key.to_s.camelize(:lower) }
        },
        options[:ssn]
      )
      response.body[:vnp_proc_create_response][:return]
    end

    def vnp_proc_update(options)
      validate_required_keys(vnp_proc_update_required_fields, options, __method__.to_s)

      response = request(
        :vnp_proc_update,
        {
          'arg0': options.transform_keys { |key| key.to_s.camelize(:lower) }
        },
        options[:ssn]
      )

      response.body[:vnp_proc_update_response][:return]
    end

    private

    def vnp_proc_create_required_fields
      %i[
        jrn_dt
        jrn_lctn_id
        jrn_status_type_cd
        jrn_user_id
        jrn_obj_id
      ]
    end

    def vnp_proc_update_required_fields
      %i[
        vnp_proc_id
        jrn_dt
        jrn_lctn_id
        jrn_obj_id
        jrn_status_type_cd
        jrn_user_id
      ]
    end
  end
end
