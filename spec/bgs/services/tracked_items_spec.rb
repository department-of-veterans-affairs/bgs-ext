# frozen_string_literal: true

require 'bgs'

describe BGS::TrackedItemsService do
  let(:test_claim_id) { '600118544' }
  let(:service) do
    BGS::Services.new(
      external_uid: 'something',
      external_key: 'something'
    )
  end

  it 'get tracked_items' do
    VCR.use_cassette('tracked_items/find_tracked_items') do
      response = service.tracked_items.find_tracked_items(test_claim_id)

      item = response.dig(:benefit_claim, :dvlpmt_items, 0) || {}

      expect(item[:name]).to eq('DevelopmentItem')
      expect(item[:claim_id]).to eq('600118544')
      expect(item[:create_dt].iso8601).to eq('2022-02-03T12:44:36-06:00')
      expect(item[:create_ptcpnt_id]).to eq('600310807')
      expect(item[:create_stn_num]).to eq('344')
      expect(item[:docid]).to eq('874994')
      expect(item[:dvlpmt_item_id]).to eq('325525')
      expect(item[:dvlpmt_tc]).to eq('CLMNTRQST')
      expect(item[:req_dt].iso8601).to eq('2022-02-04T00:00:00-06:00')
      expect(item[:short_nm]).to eq('MG-not a recognized condition')
      expect(item[:std_devactn_id]).to eq('42906')
      expect(item[:suspns_dt].iso8601).to eq('2022-03-06T00:00:00-06:00')
      expect(item[:vbms_devaction_id]).to eq('182460029')
    end
  end
end
