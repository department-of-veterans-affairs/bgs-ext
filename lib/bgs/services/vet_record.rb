# frozen_string_literal: true

# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.

module BGS
  class VetRecordWebService < BGS::Base
    def self.service_name
      'vet_record'
    end

    def bean_name
      'VetRecordServiceBean'
    end

    # updates the birls record with a new POA code
    # As per BGS the POA code is split into 2 fields
    # with the first being the first character of the poa code
    # and the second field the remaining 2 characters
    # As per BGS, CLAIM NUMBER and ssn are synonymous
    def update_birls_record(file_number:, ssn:, poa_code:)
      response = request(
        :update_birls_record,
        {
          birlsUpdateInput: {
            CLAIM_NUMBER: file_number,
            SOC_SEC_NUM: ssn,
            PAYEE_NUMBER: '00',
            POWER_OF_ATTY_CODE1: poa_code[0],
            POWER_OF_ATTY_CODE2: "#{poa_code[1]}#{poa_code[2]}"
          }
        },
        ssn
      )
      response.body[:update_birls_record_response][:return]
    end

    # find CorpDB records with first and last name
    # { numberOfRecords, Persons: [] }
    def find_corporate_record(first_name:, last_name:)
      response = request(
        :find_corporate_record,
        {
          ptcpntSearchPSNInput: {
            firstName: first_name,
            lastName: last_name
          }
        },
        "#{first_name}_#{last_name}".downcase
      )
      response.body[:find_corporate_record_response][:return]
    end
  end
end
