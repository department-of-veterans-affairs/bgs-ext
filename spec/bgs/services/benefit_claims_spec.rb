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
  let(:test_claim_id) { '600131328' }

  it 'finds claims details by participant id' do
    VCR.use_cassette('benefit_claims/find_claims_details_by_participant_id') do
      response = service.benefit_claims.find_claims_details_by_participant_id(participant_id: test_participant_id)

      expect(response).to have_key(:bnft_claim_detail)
      expect(response[:bnft_claim_detail]).to be_an_instance_of(Array)
      expect(response[:bnft_claim_detail].first).to be_an_instance_of(Hash)
      expect(response[:bnft_claim_detail].first).to have_key(:bnft_claim_id)
      expect(response[:bnft_claim_detail].first).to have_key(:bnft_claim_lc_status)
    end
  end

  it 'finds claims details by participant id' do
    VCR.use_cassette('benefit_claims/find_claim_details_by_claim_id') do
      response = service.benefit_claims.find_claim_details_by_claim_id(claim_id: test_claim_id)

      expect(response).to have_key(:bnft_claim_detail)
      expect(response[:bnft_claim_detail]).to be_an_instance_of(Hash)
      expect(response[:bnft_claim_detail]).to have_key(:bnft_claim_lc_status)
      expect(response[:bnft_claim_detail][:bnft_claim_lc_status]).to be_an_instance_of(Array)
      expect(response[:bnft_claim_detail][:bnft_claim_lc_status].first).to be_an_instance_of(Hash)
      expect(response[:bnft_claim_detail][:bnft_claim_lc_status].first).to have_key(:bnft_claim_id)
      expect(response[:bnft_claim_detail][:bnft_claim_lc_status].first).to have_key(:bnft_claim_lc_status_type_nm)
    end
  end

  it 'finds benefit claim by claim id' do
    VCR.use_cassette('benefit_claims/find_bnft_claim') do
      response = service.benefit_claims.find_bnft_claim(claim_id: test_claim_id)

      expect(response).to have_key(:bnft_claim_dto)
      expect(response[:bnft_claim_dto]).to be_an_instance_of(Hash)
      expect(response[:bnft_claim_dto][:bnft_claim_id]).to eq(test_claim_id)
    end
  end
end
