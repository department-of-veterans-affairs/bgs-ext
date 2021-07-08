# frozen_string_literal: true

require 'bgs'

describe BGS::DisabilityContentionService do
  let(:service) do
    BGS::Services.new(
      external_uid: 'something',
      external_key: 'something'
    )
  end

  it 'get read_all_veteran_representatives' do
    VCR.use_cassette('veteran_representative/read_all_veteran_representatives') do
      response = service.veteran_representative.read_all_veteran_representatives(form_type_code: '21-22A', veteran_corp_ptcpnt_id: '600043201')

      first_rep = response.first

      expect(first_rep[:form_type_code]).to eq('21-22A')
      expect(first_rep[:poa_code]).to eq('1QE')
      expect(first_rep[:limitation_alcohol]).to be_falsey
      expect(first_rep[:limitation_drug_abuse]).to be_falsey
      expect(first_rep[:limitation_hiv]).to be_falsey
      expect(first_rep[:limitation_sca]).to be_falsey
    end
  end

  it 'get read_all_veteran_representatives none found' do
    VCR.use_cassette('veteran_representative/read_all_veteran_representatives_none_found') do
      response = service.veteran_representative.read_all_veteran_representatives(form_type_code: '21-22', veteran_corp_ptcpnt_id: '600045025')

      expect(response).to eq(nil)
    end
  end
end
