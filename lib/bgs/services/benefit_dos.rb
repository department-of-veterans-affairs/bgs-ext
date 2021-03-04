# frozen_string_literal: true

# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.

module BGS
  class BenefitClaimWebService2 < BGS::Base
    def bean_name
      'BenefitClaimWebServiceBean'
    end

    def self.service_name
      'benefit_claims'
    end

    def find_bnft_claim(bnft_claim_id)
      response = request(:find_bnft_claim, 'bnftClaimId': bnft_claim_id)
      response.body[:find_bnft_claim_response][:bnft_claim_dto]
    end
  end
end
