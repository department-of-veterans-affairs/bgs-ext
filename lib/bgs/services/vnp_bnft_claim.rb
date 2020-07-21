# frozen_string_literal: true

# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.

module BGS
  class VnpBnftClaimService < BGS::Base
    def bean_name
      'VnpBnftClaimWebServiceBean'
    end

    def self.service_name
      'vnp_bnft_claim'
    end

    def vnp_bnft_claim_create(options)
      validate_required_keys(vnp_bnft_claim_create_required_fields, options, __method__.to_s)

      # we are doing this because in this call, BGS breaks camelCase convention (vnpProcID)
      payload_hash = converted_payload_hash({ 'arg0': options.transform_keys { |key| key.to_s.camelcase(:lower) } })
      response = request(:vnp_bnft_claim_create, payload_hash, options[:ssn])

      response.body[:vnp_bnft_claim_create_response][:return]
    end

    def vnp_bnft_claim_update(options)
      validate_required_keys(vnp_bnft_claim_update_required_fields, options, __method__.to_s)

      # we are doing this because in this call, BGS breaks camelCase convention (vnpProcID)
      payload_hash = converted_payload_hash({ 'arg0': options.transform_keys { |key| key.to_s.camelcase(:lower) } })
      response = request(
        :vnp_bnft_claim_update,
        payload_hash,
        options[:ssn]
      )

      response.body[:vnp_bnft_claim_update_response][:return]
    end

    private

    def converted_payload_hash(payload_hash)
      payload_hash[:arg0]['vnpProcID'] = payload_hash[:arg0].delete('vnpProcId')
      payload_hash
    end

    def vnp_bnft_claim_create_required_fields
      %i[
        vnp_proc_id
        bnft_claim_type_cd
        claim_rcvd_dt
        jrn_dt
        jrn_lctn_id
        jrn_obj_id
        jrn_status_type_cd
        jrn_user_id
        pgm_type_cd
        ptcpnt_clmant_id
        status_type_cd
        svc_type_cd
      ]
    end

    def vnp_bnft_claim_update_required_fields
      %i[
        vnp_bnft_claim_id
        bnft_claim_type_cd
        claim_rcvd_dt
        jrn_dt
        jrn_lctn_id
        jrn_obj_id
        jrn_status_type_cd
        jrn_user_id
        pgm_type_cd
        ptcpnt_clmant_id
        status_type_cd
        svc_type_cd
        vnp_proc_id
        intake_jrsdtn_lctn_id
        claim_jrsdtn_lctn_id
      ]
    end
  end
end
