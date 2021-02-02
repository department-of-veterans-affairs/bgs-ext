# frozen_string_literal: true

require 'bgs'
require 'pry'

describe BGS::DiariesService do
  let(:service) do
    BGS::Services.new(
      external_uid: 'something',
      external_key: 'something'
    )
  end

  let(:read_diary_params) { { participant_id: 'something', ssn: 'something' } }
  let(:update_diary_params) do
    {
      benficiary_id: '13014883',
      diary_due_date: Time.now.utc.iso8601,
      diary_lc_status_type: 'PEND',
      diary_lc_status_description: 'Pending',
      diary_reason_type: '24',
      diary_reason_type_description: 'Issue Dependency Verification Form',
      file_number: '546212222',
      first_name: 'Abraham',
      last_name: 'Lincoln',
      modified_action: 'I', # I
      modified_by: 'CAPSBRAN',
      modified_date: Time.now.utc.iso8601,
      modified_location: '317', # 317
      modified_process: 'cp_diary_pkg.do_create', # cp_diary_pkg.do_create
      participant_id: '13018359',
      status_date: Time.now.utc.iso8601,
      veteran_id: '13014883'
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
        response = service.diaries.update_diaries(update_diary_params)

        expect(response).to include({ error_level: '0' })
        expect(response.dig(:diaries, :diary, :award_diary_id)).to be_truthy
      end
    end
  end
end
