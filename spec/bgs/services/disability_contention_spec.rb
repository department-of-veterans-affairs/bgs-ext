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

  it 'post add_contention' do
    VCR.use_cassette('disability_contention/add_contention') do
      service.disability_contention.add_contention(cntntn_type_cd: 'NEW',
                                                   vnp_proc_id: 3830249,
                                                   vnp_ptcpnt_id: 150191)
    end
  end

  it 'post update_contention' do
    VCR.use_cassette('disability_contention/update_contention') do
      service.disability_contention.update_contention(cntntn_type_cd: 'NEW',
                                                      vnp_cntntn_id: 48688,
                                                      vnp_ptcpnt_id: 150191)
    end
  end

  it 'post update_all_contention' do
    VCR.use_cassette('disability_contention/update_all_contention') do
      service.disability_contention.update_all_contention(cntntn_type_cd: 'NEW',
                                                          vnp_cntntn_id: 48688,
                                                          vnp_ptcpnt_id: 150191)
    end
  end

  it 'post delete_all_contentions' do
    VCR.use_cassette('disability_contention/delete_all_contentions') do
      service.disability_contention.delete_all_contentions(3830249)
    end
  end

  it 'get read_all_display_disabilities' do
    VCR.use_cassette('disability_contention/read_all_display_disabilities') do
      service.disability_contention.read_all_display_disabilities(150191)
    end
  end

  it 'post add_display_disability' do
    VCR.use_cassette('disability_contention/add_display_disability') do
      service.disability_contention.add_display_disability(dsblty_dt: '2008-12-31T23:59:00.000-05:00',
                                                           dsblty_id: 1,
                                                           dsply_dt: '2008-12-31T23:59:00.000-05:00',
                                                           vnp_proc_id: 3830249,
                                                           vnp_ptcpnt_id: 150191)
    end
  end
end
