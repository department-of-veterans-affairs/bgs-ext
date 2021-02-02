# frozen_string_literal: true

require 'bgs'

describe BGS::DiariesService do
  let(:service) do
    BGS::Services.new(
      external_uid: 'something',
      external_key: 'something'
    )
  end

  let(:read_diary_params) { { participant_id: 'something', ssn: 'something' } }
  let(:update_diary_params) do
    [
      {
        award_diary_id: '71829',
        award_type: 'CPL',
        beneficary_id: '13014883',
        diary_due_date: '2014-05-01T00:00:00-05:00',
        diary_lc_status_type: 'PEND',
        diary_lc_status_type_description: 'Pending',
        diary_reason_type: '24',
        diary_reason_type_description: 'Issue Dependency Verification Form',
        file_number: '546212222',
        first_nm: 'Ray',
        last_name: 'Jakes',
        modified_action: 'I',
        modified_by: 'VAgovAPI',
        modified_date: '2021-02-02T12:12:32-06:00',
        modified_location: '281',
        modified_process: 'VAgovAPI',
        ptcpnt_diary_id: '13018359',
        status_date: '2021-02-02T12:12:32-06:00',
        veteran_id: '13014883'
      },
      {
        award_diary_id: '71830',
        award_type: 'CPL',
        beneficary_id: '13014883',
        diary_due_date: '2014-05-01T00:00:00-05:00',
        diary_lc_status_type: 'PEND',
        diary_lc_status_type_description: 'Pending',
        diary_reason_type: '24',
        diary_reason_type_description: 'Issue Dependency Verification Form',
        file_number: '546212222',
        first_nm: 'Ray',
        last_name: 'Jakes',
        modified_action: 'I',
        modified_by: 'VAgovAPI',
        modified_date: '2021-02-02T12:12:32-06:00',
        modified_location: '281',
        modified_process: 'VAgovAPI',
        ptcpnt_diary_id: '13018359',
        status_date: '2021-02-02T12:12:32-06:00',
        veteran_id: '13014883'
      },
      {
        award_diary_id: '3323',
        award_type: 'CPL',
        beneficary_id: '13014883',
        diary_due_date: '2015-05-01T00:00:00-05:00',
        diary_lc_status_type: 'PEND',
        diary_lc_status_type_description: 'Pending',
        diary_reason_type: '24',
        diary_reason_type_description: 'Issue Dependency Verification Form',
        file_number: '546212222',
        first_nm: 'Ray',
        last_name: 'Jakes',
        modified_action: 'U',
        modified_by: 'VAgovAPI',
        modified_date: '2021-02-02T12:12:31-06:00',
        modified_location: '281',
        modified_process: 'VAgovAPI',
        ptcpnt_diary_id: '13018359',
        status_date: '2006-05-02T08:32:18-05:00',
        veteran_id: '13014883'
      }
    ]
  end
  let(:update_options) do
    {
      award_type: 'CPL',
      beneficiary_id: '13014883',
      participant_id: '13014883'
    }
  end

  describe '#read_diaries' do
    it 'returns vet diary information' do
      VCR.use_cassette('diaries/read_diaries') do
        response = service.diaries.read_diaries(read_diary_params)

        expect(response).to include({ error_level: '0' })
      end
    end
  end

  describe '#update_diaries' do
    it 'updates diaries' do
      VCR.use_cassette('diaries/update_diaries') do
        response = service.diaries.update_diaries(update_options, update_diary_params)

        expect(response).to include({ error_level: '0' })
        expect(response.dig(:diaries, :diary).first).to be_truthy
      end
    end
  end
end
