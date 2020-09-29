# frozen_string_literal: true

require 'bgs'

describe BGS::RORoutingService do
  let(:service) do
    BGS::Services.new(
      external_uid: 'something',
      external_key: 'something'
    )
  end

  describe '#get_regional_office_by_zip_code' do
    it 'returns a valid regional office response' do
      VCR.use_cassette('regional_office_routing/get_regional_office_by_zip_code') do
        response = service.routing.get_regional_office_by_zip_code('19018', 'USA', '', 'CP', '123')

        expect(response[:regional_office][:number]).to eq('310')
        expect(response[:regional_office][:name]).to eq('Philadelphia')
      end
    end
  end
end
