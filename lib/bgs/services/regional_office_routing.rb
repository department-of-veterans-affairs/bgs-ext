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
      { namespaces: {'xmlns:wsdl' => 'http://www.va.gov/vba/corp/schema/roRoutingService/v20101101'}}
    end

    # Finds regional office based on Veteran's zip code
    def get_regional_office_by_zip_code()
      response = request(
        :get_regional_office_by_zip_code,
        {
          "wsdl:searchROCriteria": {
            "wsdl:zipCode": '92651',
            "wsdl:country": 'USA',
            "wsdl:province": ''
          },
          "wsdl:lob": 'CP'
        },
        '333224444'
      )
      response.body[:get_regional_office_by_zip_code_response][:return]
    end
  end
end
