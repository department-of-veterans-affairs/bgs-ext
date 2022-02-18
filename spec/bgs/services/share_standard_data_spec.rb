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
        expect(response[:return]).to be_an_instance_of(Array)
        expect(response[:return].size).to be > 1

        expect(response[:return].first[:lctn_id]).to eq('368')
        expect(response[:return].first[:nm]).to eq('Albuquerque')
        expect(response[:return].first[:pmc_lctn_id]).to eq('363')
        expect(response[:return].first[:pmc_nm]).to eq('St. Paul')
        expect(response[:return].first[:pmc_station_number]).to eq('335')
        expect(response[:return].first[:station_number]).to eq('340')
      end
    end
  end

  describe '#find_countries' do
    it 'returns a list of countries' do
      VCR.use_cassette('share_standard_data/find_countries') do
        response = service.share_data.find_countries
        expect(response[:return]).to be_an_instance_of(Array)
        expect(response[:return].size).to be > 1

        expect(response[:return].first[:cntry_type_cd]).to eq('932')
        expect(response[:return].first[:cntry_type_nm]).to eq('Afghanistan')
      end
    end
  end

  describe '#find_poas' do
    it 'finds poas' do
      VCR.use_cassette('share_standard_data/find_poas') do
        response = service.share_data.find_poas
        expect(response.first[:legacy_poa_cd]).to eq('002')
        expect(response.first[:nm]).to eq("MAINE VETERANS' SERVICES")
        expect(response.first[:org_type_nm]).to eq('POA State Organization')
        expect(response.first[:ptcpnt_id]).to eq('46004')

        uniq_org_types = response.map { |poa| poa[:org_type_nm] }.uniq
        expect(uniq_org_types.length).to eq(5)
        expect(uniq_org_types.include?('POA State Organization')).to be true
        expect(uniq_org_types.include?('POA National Organization')).to be true
        expect(uniq_org_types.include?('POA Attorney')).to be true
        expect(uniq_org_types.include?('POA Agent')).to be true
        expect(uniq_org_types.include?('POA Local/Regional Organization')).to be true
      end
    end
  end
end
