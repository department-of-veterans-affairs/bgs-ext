# frozen_string_literal: true

module BGS
  class EbenefitsBenefitClaimsStatus < BGS::Base
    def bean_name
      'EBenefitsBnftClaimStatusWebServiceBean'
    end

    def self.service_name
      'ebenefits_benefit_claims_status'
    end

    def find_benefit_claims_status_by_ptcpnt_id(participant_id:)
      response = request(:find_benefit_claims_status_by_ptcpnt_id, 'ptcpntId': participant_id)
      response.body[:find_benefit_claims_status_by_ptcpnt_id_response]
    end

    def find_benefit_claim_details_by_benefit_claim_id(benefit_claim_id:)
      response = request(:find_benefit_claim_details_by_bnft_claim_id, 'bnftClaimId': benefit_claim_id)
      response.body[:find_benefit_claim_details_by_bnft_claim_id_response]
    end
  end
end
