# frozen_string_literal: true

require 'bgs'

describe BGS::EbenefitsBenefitClaimsStatus do
  let(:service) do
    BGS::Services.new(
      external_uid: 'something',
      external_key: 'something'
    )
  end

  let(:test_participant_id) { '600043201' }

  it 'finds benefit claims status by participant id' do
    VCR.use_cassette('ebenefits_benefits_claim_status/find_benefit_claims_status_by_ptcpnt_id') do
      response = service.ebenefits_benefit_claims_status.find_benefit_claims_status_by_ptcpnt_id(
        participant_id: test_participant_id
      )

      expect(response).to have_key(:benefit_claims_dto)
      expect(response[:benefit_claims_dto]).to be_an_instance_of(Hash)
      expect(response[:benefit_claims_dto]).to have_key(:benefit_claim)
      expect(response[:benefit_claims_dto][:benefit_claim]).to be_an_instance_of(Array)
      expect(response[:benefit_claims_dto][:benefit_claim].first).to have_key(:benefit_claim_id)
      expect(response[:benefit_claims_dto][:benefit_claim].first).to have_key(:claim_status_type)
      expect(response[:benefit_claims_dto][:benefit_claim].first).to have_key(:phase_type)
    end
  end
end
