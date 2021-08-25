# frozen_string_literal: true

# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.

module BGS
  # This service is used to find Standard Data from Share.
  class StandardDataWebService < BGS::Base
    def self.service_name
      'share_data'
    end

    def bean_name
      'StandardDataWebServiceBean'
    end

    def find_benefit_claim_type_increment(ptcpnt_id:, bnft_claim_type_cd:, pgm_type_cd:, ssn: nil)
      response = request(
        :find_benefit_claim_type_increment,
        {
          ptcpntId: ptcpnt_id,
          bnftClaimTypeCd: bnft_claim_type_cd,
          pgmTypeCd: pgm_type_cd
        },
        ssn
      )

      response.body[:find_benefit_claim_type_increment_response]
    end

    # finds all the Stations that start with a '3', Regional Offices
    def find_regional_offices
      response = request(:find_regional_offices)
      response.body[:find_regional_offices_response]
    end

    def find_countries
      response = request(:find_countries)
      response.body[:find_countries_response]
    end
  end
end
