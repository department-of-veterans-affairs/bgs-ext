# frozen_string_literal: true

require 'bgs'

# rubocop:disable Metrics/BlockLength
describe BGS::ClaimantWebService do
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

  it 'get find_assigned_flashes' do
    VCR.use_cassette('claimant/find_assigned_flashes') do
      response = service.claimant.find_assigned_flashes('796123232')

      expect(response[:first_name]).to eq('LEWIS')
      expect(response[:last_name]).to eq('KELLY')
      expect(response[:middle_name]).to eq('L')
      expect(response[:ptcpnt_id]).to eq('600043179')
      expect(response[:return_code]).to eq('SHAR 9999')
      expect(response[:return_message]).to eq('Records found')
      expect(response[:vet_indicator]).to eq('Y')

      first_flash = response[:flashes].first
      expect(first_flash[:assigned_indicator]).to eq(nil)
      expect(first_flash[:flash_name].strip).to eq('Document(s) exist in VBMS')
      expect(first_flash[:flash_type]).to eq(nil)
    end
  end

  it 'get find_vbms_flash' do
    VCR.use_cassette('claimant/find_vbms_flash') do
      response = service.claimant.find_vbms_flash('796123232')

      expect(response[:assigned_indicator]).to eq('Y')
      expect(response[:flash_name].strip).to eq('VBMS')
      expect(response[:flash_type].strip).to eq('SV')
    end
  end

  it 'post add_flash' do
    VCR.use_cassette('claimant/add_flash') do
      response = service.claimant.add_flash({ file_number: '796123232',
                                              assigned_indicator: 'something',
                                              flash_name: 'here',
                                              flash_type: 'dontmatter' })
      expect(response[:return]).to eq('SHAR 9999')
    end
  end

  it 'post remove_flash' do
    VCR.use_cassette('claimant/remove_flash') do
      response = service.claimant.remove_flash({ file_number: '796123232',
                                                 assigned_indicator: '',
                                                 flash_name: '',
                                                 flash_type: '' })
      expect(response[:return]).to eq('SHAR 9999')
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

  it 'get find_general_information_by_participant_id' do
    VCR.use_cassette('claimant/find_general_information_by_participant_id') do
      response = service.claimant.find_general_information_by_participant_id('13367440')

      expect(response[:additional_service_indicator]).to eq('Y')
      expect(response[:authzn_change_clmant_addrs_ind]).to eq('Y')
      expect(response[:authzn_poa_access_ind]).to eq('N')
      expect(response[:award_type_code]).to eq('CPL')
      expect(response[:benefit_type_name]).to eq('Compensation/Pension Live')
      expect(response[:clothing_allowance_type_code]).to be_nil
      expect(response[:clothing_allowance_type_name]).to be_nil
      expect(response[:cnsldt_pymt_cd]).to be_nil
      expect(response[:cnsldt_pymt_nm]).to be_nil
      expect(response[:competency_decision_type_code]).to be_nil
      expect(response[:competency_decision_type_name]).to be_nil
      expect(response[:converted_case_indicator]).to eq('N')
      expect(response[:current_monthly_rate]).to eq('3261.1')
      expect(response[:desert_shield_indicator]).to eq('N')
      expect(response[:direct_deposit_account_id]).to eq('78725')
      expect(response[:entered_on_duty_date]).to eq('01012018')
      expect(response[:evrs]).to eq({ control: nil, exempt: nil, last_reported: nil, status: nil, type: nil })
      expect(response[:fiduciary_decision_type_code]).to be_nil
      expect(response[:fiduciary_decision_type_name]).to be_nil
      expect(response[:funds_due_incompetent_balance]).to be_nil
      expect(response[:guardian_folder_location]).to be_nil
      expect(response[:gulf_war_registry_indicator]).to eq('N')
      expect(response[:mailing_address_id]).to eq('15452236')
      expect(response[:military_branch]).to eq('Air Force')
      expect(response[:number_of_award_benes]).to eq('1')
      expect(response[:number_of_diaries]).to eq('1')
      expect(response[:number_of_evrs]).to eq('1')
      expect(response[:number_of_flashes]).to eq('2')
      expect(response[:nursing_home_indicator]).to eq('N')
      expect(response[:nursing_home_name]).to be_nil
      expect(response[:paid_through_date]).to eq('03312019')
      expect(response[:paraplegic_housing_number]).to be_nil
      expect(response[:pay_status_type_code]).to eq('AUTH')
      expect(response[:pay_status_type_name]).to eq('Authorized')
      expect(response[:payee_birth_date]).to eq('10041950')
      expect(response[:payee_name]).to eq('WEBB                          MARK')
      expect(response[:payee_ssn]).to eq('796104437')
      expect(response[:payee_sex]).to eq('M')
      expect(response[:payee_type_code]).to eq('00')
      expect(response[:payee_type_indicator]).to eq('P')
      expect(response[:payee_type_name]).to eq('Veteran')
      expect(response[:payment_address_id]).to be_nil
      expect(response[:personal_funds_of_patient_balance]).to be_nil
      expect(response[:power_of_attorney]).to eq('074 - AMERICAN LEGION')
      expect(response[:ptcpnt_bene_id]).to eq('13367440')
      expect(response[:ptcpnt_recip_id]).to eq('13367440')
      expect(response[:ptcpnt_vet_id]).to eq('13367440')
      expect(response[:released_active_duty_date]).to eq('08312018')
      expect(response[:return_code]).to eq('SHAR 9999')
      expect(response[:return_message]).to eq('Records found')
      expect(response[:station_of_jurisdiction]).to eq('317 - St. Petersburg')
      expect(response[:status_reason_date]).to eq('11012018')
      expect(response[:status_reason_type_code]).to be_nil
      expect(response[:status_reason_type_name=]).to be_nil
      expect(response[:vet_birth_date]).to eq('10041950')
      expect(response[:vet_first_name]).to eq('MARK')
      expect(response[:vet_last_name]).to eq('WEBB')
      expect(response[:vet_middle_name]).to be_nil
      expect(response[:vet_ssn]).to eq(('796104437'))
      expect(response[:vet_sex]).to eq(('M'))

      diaries = response[:diaries]
      expect(diaries[:date]).to eq('11012026')
      expect(diaries[:description]).to be_nil
      expect(diaries[:id].strip).to eq('60346')
      expect(diaries[:reason_cd].strip).to eq('24')
      expect(diaries[:reason_name].strip).to eq('Issue Dependency Verification Form')

      first_flash = response[:flashes].first
      expect(response[:flashes].size).to eq(2)
      expect(first_flash[:assigned_indicator]).to be_nil
      expect(first_flash[:flash_name].strip).to eq('Document(s) exist in VBMS')
      expect(first_flash[:flash_type]).to be_nil
    end
  end

  it 'get find_all_relationships' do
    pending('Receiving tuxedo error when hitting endpoint')

    VCR.use_cassette('claimant/find_all_relationships') do
      response = service.claimant.find_all_relationships('13367440')

      pp response
    end
  end

  it 'get find_dependents_by_participant_id' do
    VCR.use_cassette('claimant/find_dependents_by_participant_id') do
      response = service.claimant.find_dependents_by_participant_id('13367440', '796123232')

      expect(response[:number_of_records]).to eq('2')
      expect(response[:return_code]).to eq('SHAR 9999')
      expect(response[:return_message]).to eq('Records found')

      first_person = response[:persons].first
      expect(first_person[:award_indicator]).to eq('N')
      expect(first_person[:date_of_birth]).to eq('01/02/1960')
      expect(first_person[:email_address=]).to be_nil
      expect(first_person[:first_name]).to eq('JANE')
      expect(first_person[:last_name]).to eq('WEBB')
      expect(first_person[:middle_name]).to eq('M')
      expect(first_person[:ptcpnt_id]).to eq('600140899')
      expect(first_person[:related_to_vet]).to eq('Y')
      expect(first_person[:relationship]).to eq('Spouse')
      expect(first_person[:ssn]).to eq('222883214')
      expect(first_person[:veteran_indicator]).to eq('N')
    end
  end
end
# rubocop:enable Metrics/BlockLength
