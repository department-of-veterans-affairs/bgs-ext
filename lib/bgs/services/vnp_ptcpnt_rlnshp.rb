# frozen_string_literal: true

# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.

module BGS
  class VnpPtcpntRlnshpService < BGS::Base
    def bean_name
      'VnpPtcpntRlnshpWebServiceBean'
    end

    def self.service_name
      'vnp_ptcpnt_rlnshp'
    end

    def vnp_ptcpnt_rlnshp_create(options)
      validate_required_keys(vnp_ptcpnt_rlnshp_create_required_fields, options, __method__.to_s)

      response = request(
        :vnp_ptcpnt_rlnshp_create,
        {
          'arg0': options.transform_keys { |key| StringUtils.camelize(key.to_s, :lower) }
        },
        options[:ssn]
      )

      response.body[:vnp_ptcpnt_rlnshp_create_response][:return]
    end

    private

    def vnp_ptcpnt_rlnshp_create_required_fields
      %i[
        vnp_proc_id
        jrn_dt
        jrn_lctn_id
        jrn_obj_id
        jrn_status_type_cd
        jrn_user_id
        vnp_ptcpnt_id_a
        vnp_ptcpnt_id_b
        ptcpnt_rlnshp_type_nm
      ]
    end
  end
end
