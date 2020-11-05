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
      service.disability_contention.read_all_contentions(150191)
    end
  end

  it 'get read_all_display_disabilities' do
    VCR.use_cassette('disability_contention/read_all_display_disabilities') do
      service.disability_contention.read_all_display_disabilities(150191)
    end
  end

  it 'post add_contention' do
    VCR.use_cassette('disability_contention/add_contention') do
      service.disability_contention.add_contention(cntntn_type_cd: 'NEW',
                                                   vnp_proc_id: 3830249,
                                                   vnp_ptcpnt_id: 150191)
    end
  end
end
