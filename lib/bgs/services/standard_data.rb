# frozen_string_literal: true

# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.

module BGS
  # This service is used to find Standard Data from Share.
  class StandardDataService < BGS::Base
    def self.service_name
      'data'
    end

    def bean_name
      'StandardDataService'
    end

    def get_contention_classification_type_code_list
      response = request(:get_contention_classification_type_code_list)
      response.body[:get_contention_classification_type_code_list_response][:return]
    end
  end
end
