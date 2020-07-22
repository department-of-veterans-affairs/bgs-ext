# frozen_string_literal: true

# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.

require_relative('../../string.rb')

module BGS
  class VnpPtcpntAddrsService < BGS::Base
    def bean_name
      'VnpPtcpntAddrsWebServiceBean'
    end

    def self.service_name
      'vnp_ptcpnt_addrs'
    end

    def vnp_ptcpnt_addrs_create(options)
      validate_required_keys(vnp_ptcpnt_addrs_create_required_fields, options, __method__.to_s)

      response = request(
        :vnp_ptcpnt_addrs_create,
        {
          'arg0': options.transform_keys { |key| key.to_s.camelize(:lower) }
        },
        options[:ssn]
      )

      response.body[:vnp_ptcpnt_addrs_create_response][:return]
    end

    private

    def vnp_ptcpnt_addrs_create_required_fields
      %i[
        efctv_dt
        vnp_ptcpnt_id
        vnp_proc_id
        jrn_dt
        jrn_lctn_id
        jrn_obj_id
        jrn_status_type_cd
        jrn_user_id
        ptcpnt_addrs_type_nm
        shared_addrs_ind
      ]
    end
  end
end
