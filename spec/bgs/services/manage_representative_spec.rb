# frozen_string_literal: true

require 'bgs'

describe BGS::ManageRepresentativeService do

  let(:participant_id) { '31164997' }
  let(:service) do
    BGS::Services.new(
      external_uid: 'something',
      external_key: 'something'
    )
  end

  it 'lists a single POA requests' do
    VCR.use_cassette('manage_representative/read_poa_request_by_ptcpnt_id') do
      response = service.manage_representative.read_poa_request_by_ptcpnt_id(participant_id: participant_id)
      list = response[:poa_request_respond_return_vo_list]
      expect(list[:vso_user_email]).to eq(nil)
      expect(list[:vso_user_first_name]).to eq("VDC USER")
      expect(list[:vso_user_last_name]).to eq(nil)
      expect(list[:change_address_auth]).to eq("N")
      expect(list[:claimant_city]).to eq(nil)
      expect(list[:claimant_country]).to eq("USA")
      expect(list[:claimant_military_po]).to eq("APO")
      expect(list[:claimant_military_postal_code]).to eq("AE")
      expect(list[:claimant_state]).to eq(nil)
      expect(list[:claimant_zip]).to eq("09021")
      expect(list[:date_request_actioned].to_s).to eq('2019-06-26T12:03:44-05:00')
      expect(list[:date_request_received].to_s).to eq('2019-06-26T12:03:44-05:00')
      expect(list[:declined_reason]).to eq(nil)
      expect(list[:health_info_auth]).to eq("N")
      expect(list[:poa_code]).to eq("091")
      expect(list[:proc_id]).to eq("19809")
      expect(list[:secondary_status]).to eq("New")
      expect(list[:vet_first_name]).to eq("HECTOR")
      expect(list[:vet_last_name]).to eq("ALLEN")
      expect(list[:vet_middle_name]).to eq("J")
      expect(list[:vet_ptcpnt_id]).to eq("31164997")
      expect(response[:total_nbr_of_records]).to eq("1")
    end
  end

  it 'lists a single POA requests' do
    pending('Receiving No Record Found error when hitting endpoint')

    VCR.use_cassette('manage_representative/read_poa_request_by_ptcpnt_id_not_found') do
      service.manage_representative.read_poa_request_by_ptcpnt_id(participant_id: 31167367)
    end
  end

end
