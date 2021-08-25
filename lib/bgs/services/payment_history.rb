module BGS
  # This service is used to store information about individuals the VA is
  # interested in. This information may be kept permanently, removed or discarded
  # if appropriate.
  class PaymentHistoryWebService < BGS::Base
    def self.service_name
      'payment_history'
    end
    # Find a Person, as defined by the Person Web Service, by their SSN.
    def find_by_ssn(ssn)
      response = request(:find_pay_history_by_ssn, { ssn: ssn }, ssn)

      response.body[:find_pay_history_by_ssn_response][:return]
    end
  end
end
