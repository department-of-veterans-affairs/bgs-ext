# frozen_string_literal: true

# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.

module BGS
  class BenefitClaimWebServiceV1 < BGS::Base
    def bean_name
      'BenefitClaimWebServiceBean'
    end

    def self.service_name
      'benefit_claims'
    end

    def find_claims_details_by_participant_id(participant_id:)
      response = request(:find_bnft_claim_detail_by_ptcpnt_id, ptcpntId: participant_id)
      response.body[:find_bnft_claim_detail_by_ptcpnt_id_response]
    end

    def find_claim_details_by_claim_id(claim_id:)
      response = request(:find_bnft_claim_detail_by_bnft_claim_id, bnftClaimId: claim_id)
      response.body[:find_bnft_claim_detail_by_bnft_claim_id_response]
    end

    def find_bnft_claim(claim_id:)
      response = request(:find_bnft_claim, bnftClaimId: claim_id)
      response.body[:find_bnft_claim_response]
    end

    # Note in BGS docs: A call to findBnftClaim should be made prior to calling this method,
    # as each value returned in findBnftClaim should be passed as input to updateBnftClaim, along with any updates.
    # Failure to call findBnftClaim and provide all the date runs a risk of data corruption.
    def update_bnft_claim(claim:)
      # This works in rails, but not pure ruby
      # claim.deep_transform_keys! { |key| key.to_s.camelize(:lower).to_sym }
      # This isn't as pretty, but works in pure ruby
      claim.transform_keys! do |key|
        str = key.to_s.downcase.split('_').collect(&:capitalize).join
        str[0] = str[0].downcase
        str.to_sym
      end

      response = request(:update_bnft_claim, claim, claim[:bnftClaimId])
      response.body[:update_bnft_claim_response]
    end
  end
end
