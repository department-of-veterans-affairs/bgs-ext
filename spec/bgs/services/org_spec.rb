# frozen_string_literal: true

require 'bgs'

describe BGS::OrgWebService do

  let(:participant_id) { '13367440' }
  let(:service) do
    BGS::Services.new(
      external_uid: 'something',
      external_key: 'something'
    )
  end

  it 'get find_poa_history_by_ptcpnt_id' do
    VCR.use_cassette('org/find_poa_history_by_ptcpnt_id') do
      response = service.org.find_poa_history_by_ptcpnt_id(participant_id)

      first_item = response[:person_poa_history][:person_poa].sort_by { |poa| !poa[:begin_dt] }.first
      expect(first_item[:legacy_poa_cd]).to eq('074')
    end
  end
end
