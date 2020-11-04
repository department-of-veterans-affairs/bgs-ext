# frozen_string_literal: true

require 'bgs'

describe BGS::DisabilityContentionService do
  let(:service) do
    BGS::Services.new(
      external_uid: 'something',
      external_key: 'something'
    )
  end

  it 'get read_all_contentions' do
    VCR.use_cassette('disability_contention/read_all_contentions') do
      response = service.disability_contention.read_all_contentions(13367440)
    end
  end

  it 'get read_all_display_disabilities' do
    VCR.use_cassette('disability_contention/read_all_display_disabilities') do
      response = service.disability_contention.read_all_display_disabilities(13367440)
    end
  end
end
