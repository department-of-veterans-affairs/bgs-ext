# frozen_string_literal: true

# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.

module BGS
  class IntentToFileWebService < BGS::Base
    def bean_name
      'IntentToFileWebServiceBean'
    end

    def self.service_name
      'intent_to_file'
    end

    def find_intent_to_file_by_participant_id(participant_id)
      response = request(
        :find_intent_to_file_by_ptcpnt_id, 'ptcpntId': participant_id
      )
      response.body[:find_intent_to_file_by_ptcpnt_id_response][:intent_to_file_dto]
    end

    def insert_intent_to_file(options)
      validate_required_keys(required_insert_intent_to_file_fields, options, __method__.to_s)

      response = request(
        :insert_intent_to_file,
        {
          "intentToFileDTO": {
            "itfTypeCd": options[:intent_to_file_type_code],
            "ptcpntClmantId": options[:participant_claimant_id],
            "ptcpntVetId": options[:participant_vet_id],
            "rcvdDt": options[:received_date],
            "signtrInd": options[:signature_indicated],
            "submtrApplcnTypeCd": options[:submitter_application_icn_type_code]

          }
        },
        options[:ssn]
      )
      response.body[:insert_intent_to_file_response][:intent_to_file_dto]
    end

    def update_intent_to_file(options)
      validate_required_keys(required_update_intent_to_file_fields, options, __method__.to_s)

      response = request(
        :update_intent_to_file,
        {
          "intentToFileDTO": {
            "createDt": options[:created_date],
            "intentToFileId": options[:intent_to_file_id],
            "itfStatusTypeCd": options[:intent_to_file_status_code],
            "itfTypeCd": options[:intent_to_file_type_code],
            "rcvdDt": options[:received_date],
            "submtrAppIcnTypeCd": options[:submitter_application_icn_type_code],
            "submtrApplcnTypeCd": options[:submitter_application_icn_type_code],
            "ptcpntVetId": options[:participant_vet_id],
            "ptcpntClmantId": options[:participant_claimant_id],
            "vetFileNbr": options[:veteran_file_number]
          }
        },
        options[:ssn]
      )
      response.body[:update_intent_to_file_response][:intent_to_file_dto]
    end

    private

    def required_insert_intent_to_file_fields
      %i[
        intent_to_file_type_code
        participant_claimant_id
        participant_vet_id
        received_date
        signature_indicated
        submitter_application_icn_type_code
      ]
    end

    def required_update_intent_to_file_fields
      %i[
        intent_to_file_id
        intent_to_file_type_code
        received_date
        submitter_application_icn_type_code
      ]
    end
  end
end
