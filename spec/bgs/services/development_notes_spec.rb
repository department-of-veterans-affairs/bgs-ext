# frozen_string_literal: true

require 'bgs'

describe BGS::DevelopmentNotesService do
  let(:service) do
    BGS::Services.new(
      external_uid: 'something',
      external_key: 'something'
    )
  end

  let(:create_note_params) do
    {
      jrn_dt: Time.now.iso8601,
      jrn_lctn_id: '281',
      jrn_status_type_cd: 'U',
      jrn_user_id: 'VAgovAPI',
      jrn_obj_id: 'VAgovAPI',
      jrn_stt_tc: 'I',
      name: 'Claim rejected by VA.gov',
      bnft_clm_note_tc: 'CLMDVLNOTE',
      clm_id: '600195988',
      ptcpnt_id: '600338791',
      txt: 'Claim rejected by VA.gov: This application needs manual review.'
    }
  end

  describe '#find_development_notes_by_pid' do
    it 'returns the notes for the participant' do
      VCR.use_cassette('development_notes/find_development_notes_by_pid') do
        response = service.notes.find_development_notes_by_pid('600338791')

        expect(response).to include(:notes)
        expect(response[:notes].size).to be > 5

        expect(response[:notes][0]).to include({ ptcpnt_id: '600338791' })
      end
    end
  end

  describe '#create_note' do
    it 'creates a note for the participant' do
      VCR.use_cassette('development_notes/create_note') do
        create_note_response = service.notes.create_note(create_note_params)
        note = create_note_response[:note]

        expect(note).to include(
          {
            name: 'Note',
            bnft_clm_note_tc: 'CLMDVLNOTE',
            clm_id: '600195988',
            note_out_tn: 'Claim Development Note',
            ptcpnt_id: '600338791',
            txt: 'Claim rejected by VA.gov: This application needs manual review.'
          }
        )
      end
    end
  end
end
