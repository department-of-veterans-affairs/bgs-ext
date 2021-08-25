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
      VCR.use_cassette('share_standard_data/find_regional_offices') do
        response = service.share_data.find_regional_offices
        expect(response).to be_an_instance_of(Array)
        expect(response.size).to be > 1

        expect(response.first[:lctn_id]).to eq('368')
        expect(response.first[:nm]).to eq('Albuquerque')
        expect(response.first[:pmc_lctn_id]).to eq('363')
        expect(response.first[:pmc_nm]).to eq('St. Paul')
        expect(response.first[:pmc_station_number]).to eq('335')
        expect(response.first[:station_number]).to eq('340')
      end
    end
  end

  describe '#find_countries' do
    it 'returns a list of countries' do
      VCR.use_cassette('share_standard_data/find_countries') do
        response = service.share_data.find_countries
        expect(response).to be_an_instance_of(Array)
        expect(response.size).to be > 1

        expect(response.first[:cntry_type_cd]).to eq('932')
        expect(response.first[:cntry_type_nm]).to eq('Afghanistan')
      end
    end
  end
end
