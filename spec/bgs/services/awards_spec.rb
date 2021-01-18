# frozen_string_literal: true

require 'bgs'

describe BGS::AwardWebService do
  let(:file_number) { '796123232' }
  let(:ssn) { '796104437' }
  let(:participant_id) { '2815236' }
  let(:service) do
    BGS::Services.new(
      external_uid: 'something',
      external_key: 'something'
    )
  end

  it 'should find award by file number' do
    VCR.use_cassette('award/find_award_by_file_number') do
      response = service.awards.find_award_by_file_number(file_number, ssn)
      expect(response[:gross_amt]).to eq('0.0')
    end
  end

  it 'should find award by ssn' do
    VCR.use_cassette('award/find_award_by_ssn') do
      response = service.awards.find_award_by_ssn(ssn)
      expect(response[:gross_amt]).to eq('0.0')
    end
  end

  it 'should find award by participant id' do
    VCR.use_cassette('award/find_award_by_participant_id') do
      response = service.awards.find_award_by_participant_id(participant_id, ssn)
      expect(response[:gross_amt]).to eq('0.0')
    end
  end
end
