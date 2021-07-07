# frozen_string_literal: true

require 'bgs'

describe BGS::BenefitClaimWebServiceV1 do
  let(:service) do
    BGS::Services.new(
      external_uid: 'something',
      external_key: 'something'
    )
  end

  let(:test_participant_id) { '600043201' }

  it 'finds claims details by participant id' do
    VCR.use_cassette('benefit_claims/find_claims_details_by_participant_id') do
      response = service.benefit_claims.find_claims_details_by_participant_id(participant_id: test_participant_id)

      root_attribute = :find_bnft_claim_detail_by_ptcpnt_id_response
      expect(response).to have_key(root_attribute)
      expect(response[root_attribute]).to have_key(:bnft_claim_detail)
      expect(response[root_attribute][:bnft_claim_detail]).to be_an_instance_of(Array)
      expect(response[root_attribute][:bnft_claim_detail].first).to be_an_instance_of(Hash)
      expect(response[root_attribute][:bnft_claim_detail].first).to have_key(:bnft_claim_id)
      expect(response[root_attribute][:bnft_claim_detail].first).to have_key(:bnft_claim_lc_status)
    end
  end
end
