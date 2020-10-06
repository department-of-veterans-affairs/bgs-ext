# frozen_string_literal: true

require 'bgs'

describe BGS::PaymentInformationService do

  let(:participant_id) { '600036156' }
  let(:file_number) { '796148937' }
  let(:payee_code) { '00' }
  let(:ssn) { '796148937' }
  let(:service) do
    BGS::Services.new(
      external_uid: 'something',
      external_key: 'something'
    )
  end

  it 'returns payment information' do
    VCR.use_cassette('payment_information/retrieve_payment_summary_with_bdn') do
      response = service.payment_information.retrieve_payment_summary_with_bdn(participant_id, file_number, payee_code, ssn)
      # using >= here in case additional payments are added
      expect(response[:payments][:payment].count).to be >= 78
    end
  end

end
