# frozen_string_literal: true

require 'bgs'

# rubocop:disable Metrics/BlockLength
describe BGS::IntentToFileWebService do
  let(:file_number) { '123456789' }
  let(:services) do
    BGS::Services.new(
      external_uid: 'something',
      external_key: 'something'
    )
  end

  context 'it should properly process intent to file requests' do
    it 'get find_intent_to_file_by_participant_id' do
      VCR.use_cassette("intent_to_file/find_intent_to_file_by_participant_id") do
        # response = Net::HTTP.get_response(URI('http://www.google.com'))
        services.intent_to_file.find_intent_to_file_by_participant_id('2815236')
      end
    end

    # it 'post insert_intent_to_file' do
    #   # VCR.use_cassette("intent_to_file/insert_intent_to_file") do
    #   #   response = Net::HTTP.get_response(URI('http://www.google.com'))
    #   # end
    # end

    # it 'put update_intent_to_file' do
    #   # VCR.use_cassette("intent_to_file/update_intent_to_file") do
    #   #   response = Net::HTTP.get_response(URI('http://www.google.com'))
    #   # end
    # end
  end
end