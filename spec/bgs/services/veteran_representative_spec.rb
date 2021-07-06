# frozen_string_literal: true

require 'bgs'

describe BGS::DisabilityContentionService do # rubocop:disable Metrics/BlockLength
    let(:service) do
      BGS::Services.new(
        external_uid: 'something',
        external_key: 'something'
      )
    end
  
    it 'get read_all_veteran_representatives' do
      VCR.use_cassette('veteran_representative/read_all_veteran_representatives') do
        # response = service.veteran_representative.read_all_veteran_representatives(form_type_code: 2122, veteran_corp_ptcpnt_id: 150191)
        # response = service.veteran_representative.read_all_veteran_representatives(form_type_code: 2122, veteran_corp_ptcpnt_id: 600043179)
        response = service.veteran_representative.read_all_veteran_representatives(form_type_code: 2122, veteran_corp_ptcpnt_id: 600036156)
  
        # first_rep = response.first
        binding.pry
      end
    end
  end
  