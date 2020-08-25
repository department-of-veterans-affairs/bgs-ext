# frozen_string_literal: true

require 'bgs'

# rubocop:disable Metrics/BlockLength
describe BGS::UploadedDocumentWebService do

  let(:participant_id) { '13367440' }
  let(:service) do
    BGS::Services.new(
      external_uid: 'something',
      external_key: 'something'
    )
  end

  it 'returns payment history' do
    VCR.use_cassette('uploaded_documents/find_by_participant_id') do
      response = service.uploaded_document.find_by_participant_id(participant_id)
      expect(response.size).to eq(286)
    end
  end

end
