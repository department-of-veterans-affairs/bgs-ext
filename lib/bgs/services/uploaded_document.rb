# frozen_string_literal: true

# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.

module BGS
  class UploadedDocumentWebService < BGS::Base
    def bean_name
      'UploadedDocumentWebServiceBean'
    end

    def self.service_name
      'uploaded_document'
    end

    def find_by_participant_id(participant_id)
      response = request(
        :find_uplded_dcmnt_by_ptcpnt_id, 'ptcpntId': participant_id,
      )
      response.body[:find_uplded_dcmnt_by_ptcpnt_id_response][:bnft_claim_dto]
    end
  end
end
