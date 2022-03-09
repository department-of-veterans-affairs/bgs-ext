# frozen_string_literal: true

module BGS
  # This service is used to store information about individuals the VA is
  # interested in. This information may be kept permanently, removed or discarded
  # if appropriate.
  class DevelopmentNotesService < BGS::Base
    def bean_name
      'DevelopmentNotesService'
    end

    def self.service_name
      'notes'
    end

    def find_development_notes_by_pid(participant_id, ssn = nil)
      response = request(:find_development_notes_by_vet_ptcpnt_id, { ptcpntId: participant_id }, ssn)
      response.body[:find_development_notes_by_vet_ptcpnt_id_response]
    end

    def create_note(options)
      response = request(
        :create_note, {
          'note' => {
            'jrnDt' => options[:jrn_dt],
            'jrnLctnId' => options[:jrn_lctn_id],
            'jrnObjId' => options[:jrn_obj_id],
            'jrnSttTc' => options[:jrn_stt_tc],
            'jrnUserId' => options[:jrn_user_id],
            'name' => options[:name],
            'bnftClmNoteTc' => options[:bnft_clm_note_tc],
            'clmId' => options[:clm_id],
            'ptcpntId' => options[:ptcpnt_id],
            'txt' => options[:txt]
          }
        }
      )

      response.body[:create_note_response]
    end
  end
end
