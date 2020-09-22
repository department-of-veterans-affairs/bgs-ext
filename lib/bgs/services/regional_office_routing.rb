# frozen_string_literal: true

# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.

module BGS
  class RORoutingService < BGS::Base
    def bean_name
      'RORoutingServiceWS'
    end

    def self.service_name
      'routing'
    end

    def namespace
      { namespaces: {'xmlns:wsdl' => 'PLACEHOLDER URL'}}
    end

    # Finds regional office based on Veteran's zip code
    def get_regional_office_by_zip_code(zip_code, country, province, lob, ssn)
      response = request(
        :get_regional_office_by_zip_code,
        {
          "wsdl:searchROCriteria": {
            "wsdl:zipCode": zip_code,
            "wsdl:country": country,
            "wsdl:province": province
          },
          "wsdl:lob": lob
        },
        ssn
      )
      response.body[:get_regional_office_by_zip_code_response]
    end
  end
end
