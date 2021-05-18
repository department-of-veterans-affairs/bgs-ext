# frozen_string_literal: true

require 'bgs'

describe BGS::CorporateUpdateWebService do
  let(:poa_code) { '091' }
  let(:participant_id) { '600043201' }
  let(:service) do
    BGS::Services.new(
      external_uid: 'something',
      external_key: 'something'
    )
  end

  xit 'updates poa access' do
    pending('Receiving tuxedo error when hitting endpoint')
    
    VCR.use_cassette('corporate_update/update_poa_access') do
      service.corporate_update.update_poa_access(
        participant_id: participant_id,
        poa_code: poa_code
      )
    end
  end
end
