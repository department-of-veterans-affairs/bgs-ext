# frozen_string_literal: true

require 'bgs'

describe BGS::StandardDataService do
  let(:service) do
    BGS::Services.new(
      external_uid: 'something',
      external_key: 'something'
    )
  end

  describe '#get_contention_classification_type_code_list' do
    it 'returns a list of contention classification type codes' do
      VCR.use_cassette('standard_data/get_contention_classification_type_code_list') do
        response = service.data.get_contention_classification_type_code_list
        expect(response).to be_an_instance_of(Array)
        expect(response.size).to be > 1

        expect(response.first[:name]).to eq('ContentionClassification')
        expect(response.first[:clsfcn_id]).to eq('10')
        expect(response.first[:clsfcn_txt]).to eq('abnormal heart')
        expect(response.first[:end_dt]).to eq(DateTime.parse('2016-02-04T11:51:56-06:00'))
      end
    end
  end
end
