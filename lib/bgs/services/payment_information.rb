module BGS
  # This service gets payment summary and payment details from both
  # Corporate and BDN databases (VETSNET payments only).
  # This service uses the following tuxedo services: tptodmiv, shrinq8, getBDNPayments

  class PaymentInformationService < BGS::Base
    # bean_name is used when generating the endpoint URL
    def bean_name
      'vrm-ws'
    end

    def self.service_name
      'payment_information'
    end

    # This service is used to find the summary payment information from both the Corporate and BDN Databases.
    def retrieve_payment_summary_with_bdn(participant_id, file_number, payee_code, ssn)
      response = request(
        :retrieve_payment_summary_with_bdn,
        {
          'ParticipantId': participant_id,
          'FileNumber': file_number,
          'PayeeCode': payee_code
        },
        ssn)

      response.body[:retrieve_payment_summary_with_bdn_response][:payment_summary_response]
    end
  end
end
