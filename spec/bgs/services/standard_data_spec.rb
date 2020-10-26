# frozen_string_literal: true

require 'bgs'

describe BGS::StandardDataWebService do
  let(:service) do
    BGS::Services.new(
      external_uid: 'something',
      external_key: 'something'
    )
  end

  describe '#find_regional_offices' do
    it 'returns a list of regional offices' do
      VCR.use_cassette('standard_data/find_regional_offices') do
        response = service.data.find_regional_offices
        expect(response[:return]).to be_an_instance_of(Array)
        # don't want to use an exact match here
        # in case regional offices get closed or added
        expect(response[:return].size).to be > 1
      end
    end
  end
end
