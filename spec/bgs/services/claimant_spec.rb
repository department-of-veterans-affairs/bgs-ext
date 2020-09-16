# frozen_string_literal: true

require 'bgs'

# rubocop:disable Metrics/BlockLength
describe BGS::ClaimantWebService do
  let(:file_number) { '123456789' }
  let(:service) do
    BGS::Services.new(
      external_uid: 'something',
      external_key: 'something'
    )
  end

  it 'get find_flashes' do
    VCR.use_cassette('claimant/find_flashes') do
      response = service.claimant.find_flashes('796123232')

      expect(response[:first_name]).to eq('LEWIS')
      expect(response[:last_name]).to eq('KELLY')
      expect(response[:middle_name]).to eq('L')
      expect(response[:number_of_flashes]).to eq(response[:flashes].size.to_s)
      expect(response[:ptcpnt_id]).to eq('600043179')
      expect(response[:return_code]).to eq('SHAR 9999')
      expect(response[:return_message]).to eq('Records found')
      expect(response[:vet_indicator]).to eq('Y')

      first_flash = response[:flashes].first
      expect(first_flash[:assigned_indicator]).to eq('Y')
      expect(first_flash[:flash_name].strip).to eq('Document(s) exist in VBMS')
      expect(first_flash[:flash_type].strip).to eq('SV')
    end
  end

  it 'get find_poa_by_participant_id' do
    VCR.use_cassette('claimant/find_poa_by_participant_id') do
      response = service.claimant.find_poa_by_participant_id('13367440')

      expect(response[:authzn_change_clmant_addrs_ind]).to eq('Y')
      expect(response[:authzn_poa_access_ind]).to eq('N')
      expect(response[:begin_date]).to eq('10/23/2019')
      expect(response[:end_date]).to be_nil
      expect(response[:event_date]).to be_nil
      expect(response[:healthcare_provider_release_indicator]).to be_nil
      expect(response[:journal_date]).to eq('10/23/2019')
      expect(response[:journal_location_id]).to eq('281')
      expect(response[:journal_status_type_code]).to eq('I')
      expect(response[:journal_user_id]).to eq('VAEBENEFITS')
      expect(response[:person_or_organization_indicator]).to eq('O')
      expect(response[:person_org_attention_text]).to be_nil
      expect(response[:person_org_name]).to eq('074 - AMERICAN LEGION')
      expect(response[:person_org_ptcpnt_id]).to eq('45970')
      expect(response[:person_organization_code]).to be_nil
      expect(response[:person_organization_name]).to eq('POA National Organization')
      expect(response[:prepositional_phrase_name]).to be_nil
      expect(response[:rate_name]).to be_nil
      expect(response[:relationship_name]).to eq('Power of Attorney For')
      expect(response[:status_code]).to be_nil
      expect(response[:temporary_custodian_indicator]).to be_nil
      expect(response[:veteran_ptcpnt_id]).to eq('13367440')
    end
  end
end
# rubocop:enable Metrics/BlockLength
