# frozen_string_literal: true

require 'bgs'

# rubocop:disable Metrics/BlockLength
describe BGS::PaymentHistoryWebService do

  let(:ssn) { '796104437' }
  let(:service) do
    BGS::Services.new(
      external_uid: 'something',
      external_key: 'something'
    )
  end

  it 'returns payment history' do
    VCR.use_cassette('payment_history/find_by_ssn') do
      response = service.payment_history.find_by_ssn(ssn)
      expect(response[:payment_record][:payments].count).to eq(27)
    end
  end

end
