# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.

module LighthouseBGS
  class VetRecordWebService < LighthouseBGS::Base
    def self.service_name
      "vet_record"
    end

    # updates the birls record with a new POA code
    # As per BGS the POA code is split into 2 fields
    # with the first being the first character of the poa code
    # and the second field the remaining 2 characters
    def update_birls_record(ssn:, poa_code:)
      response = request(
        :update_birls_record,
        {
          "birlsUpdateInput": {
            "SOC_SEC_NUMBER": ssn,
            "POWER_OF_ATTY_CODE1": poa_code.first,
            "POWER_OF_ATTY_CODE2": "#{poa_code[1]}#{poa_code[2]}"
          }
        },
        ssn
      )
      response.body[:update_birls_record_response][:return]
    end
  end
end

