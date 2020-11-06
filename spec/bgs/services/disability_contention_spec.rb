# frozen_string_literal: true

require 'bgs'

describe BGS::DisabilityContentionService do # rubocop:disable Metrics/BlockLength
  let(:service) do
    BGS::Services.new(
      external_uid: 'something',
      external_key: 'something'
    )
  end

  it 'get read_all_contentions' do
    VCR.use_cassette('disability_contention/read_all_contentions') do
      response = service.disability_contention.read_all_contentions(150191)

      first_contention = response.first
      expect(first_contention[:jrn_dt]).to eq(DateTime.parse('2020-11-05T09:16:09-06:00'))
      expect(first_contention[:jrn_lctn_id]).to eq('281')
      expect(first_contention[:jrn_obj_id]).to eq('VAgovAPI')
      expect(first_contention[:jrn_status_type_cd]).to eq('I')
      expect(first_contention[:jrn_user_id]).to eq('VAgovAPI')
      expect(first_contention[:cntntn_type_cd]).to eq('NEW')
      expect(first_contention[:med_ind]).to eq(false)
      expect(first_contention[:vnp_cntntn_id]).to eq('48683')
      expect(first_contention[:vnp_proc_id]).to eq('3830249')
      expect(first_contention[:vnp_ptcpnt_id]).to eq('150191')
    end
  end

  it 'post add_contention' do
    VCR.use_cassette('disability_contention/add_contention') do
      response = service.disability_contention.add_contention(cntntn_type_cd: 'NEW',
                                                              vnp_proc_id: 3830249,
                                                              vnp_ptcpnt_id: 150191)

      expect(response[:jrn_dt]).to eq(DateTime.parse('2020-11-05T10:17:08-06:00'))
      expect(response[:jrn_lctn_id]).to eq('281')
      expect(response[:jrn_obj_id]).to eq('VAgovAPI')
      expect(response[:jrn_status_type_cd]).to eq('I')
      expect(response[:jrn_user_id]).to eq('VAgovAPI')
      expect(response[:cntntn_type_cd]).to eq('NEW')
      expect(response[:med_ind]).to eq(false)
      expect(response[:vnp_cntntn_id]).to eq('48713')
      expect(response[:vnp_proc_id]).to eq('3830249')
      expect(response[:vnp_ptcpnt_id]).to eq('150191')
    end
  end

  it 'post update_contention' do
    VCR.use_cassette('disability_contention/update_contention') do
      response = service.disability_contention.update_contention(cntntn_type_cd: 'NEW',
                                                                 vnp_cntntn_id: 48688,
                                                                 vnp_ptcpnt_id: 150191)

      expect(response[:jrn_dt]).to eq(DateTime.parse('2020-11-05T10:01:15-06:00'))
      expect(response[:jrn_lctn_id]).to eq('281')
      expect(response[:jrn_obj_id]).to eq('VAgovAPI')
      expect(response[:jrn_status_type_cd]).to eq('I')
      expect(response[:jrn_user_id]).to eq('VAgovAPI')
      expect(response[:cntntn_type_cd]).to eq('NEW')
      expect(response[:med_ind]).to eq(false)
      expect(response[:vnp_cntntn_id]).to eq('48688')
      expect(response[:vnp_proc_id]).to eq('3830249')
      expect(response[:vnp_ptcpnt_id]).to eq('150191')
    end
  end

  it 'post update_all_contention' do
    VCR.use_cassette('disability_contention/update_all_contention') do
      response = service.disability_contention.update_all_contention(cntntn_type_cd: 'NEW',
                                                                     vnp_cntntn_id: 48688,
                                                                     vnp_ptcpnt_id: 150191)

      expect(response[:jrn_dt]).to eq(DateTime.parse('2020-11-05T10:01:15-06:00'))
      expect(response[:jrn_lctn_id]).to eq('281')
      expect(response[:jrn_obj_id]).to eq('VAgovAPI')
      expect(response[:jrn_status_type_cd]).to eq('I')
      expect(response[:jrn_user_id]).to eq('VAgovAPI')
      expect(response[:cntntn_type_cd]).to eq('NEW')
      expect(response[:med_ind]).to eq(false)
      expect(response[:vnp_cntntn_id]).to eq('48688')
      expect(response[:vnp_proc_id]).to eq('3830249')
      expect(response[:vnp_ptcpnt_id]).to eq('150191')
    end
  end

  it 'post delete_all_contentions' do
    VCR.use_cassette('disability_contention/delete_all_contentions') do
      service.disability_contention.delete_all_contentions(3830249)
    end
  end

  it 'get read_all_display_disabilities' do
    VCR.use_cassette('disability_contention/read_all_display_disabilities') do
      response = service.disability_contention.read_all_display_disabilities(150191)

      first_display_disability = response.first
      expect(first_display_disability[:jrn_dt]).to eq(DateTime.parse('2020-11-05T15:38:26-06:00'))
      expect(first_display_disability[:jrn_lctn_id]).to eq('281')
      expect(first_display_disability[:jrn_obj_id]).to eq('VAgovAPI')
      expect(first_display_disability[:jrn_status_type_cd]).to eq('I')
      expect(first_display_disability[:jrn_user_id]).to eq('VAgovAPI')
      expect(first_display_disability[:dsblty_dt]).to eq(DateTime.parse('2008-12-31T22:59:00-06:00'))
      expect(first_display_disability[:dsblty_id]).to eq('1')
      expect(first_display_disability[:dsply_dt]).to eq(DateTime.parse('2008-12-31T22:59:00-06:00'))
      expect(first_display_disability[:vnp_dsblty_dsply_id]).to eq('33671')
      expect(first_display_disability[:vnp_proc_id]).to eq('3830249')
      expect(first_display_disability[:vnp_ptcpnt_id]).to eq('150191')
    end
  end

  it 'post add_display_disability' do
    VCR.use_cassette('disability_contention/add_display_disability') do
      response = service.disability_contention.add_display_disability(dsblty_dt: '2008-12-31T23:59:00.000-05:00',
                                                                      dsblty_id: 1,
                                                                      dsply_dt: '2008-12-31T23:59:00.000-05:00',
                                                                      vnp_proc_id: 3830249,
                                                                      vnp_ptcpnt_id: 150191)

      expect(response[:jrn_dt]).to eq(DateTime.parse('2020-11-05T15:52:37-06:00'))
      expect(response[:jrn_lctn_id]).to eq('281')
      expect(response[:jrn_obj_id]).to eq('VAgovAPI')
      expect(response[:jrn_status_type_cd]).to eq('I')
      expect(response[:jrn_user_id]).to eq('VAgovAPI')
      expect(response[:dsblty_dt]).to eq(DateTime.parse('2008-12-31T22:59:00-06:00'))
      expect(response[:dsblty_id]).to eq('1')
      expect(response[:dsply_dt]).to eq(DateTime.parse('2008-12-31T22:59:00-06:00'))
      expect(response[:vnp_dsblty_dsply_id]).to eq('33673')
      expect(response[:vnp_proc_id]).to eq('3830249')
      expect(response[:vnp_ptcpnt_id]).to eq('150191')
    end
  end

  it 'post delete_all_display_disabilities' do
    VCR.use_cassette('disability_contention/delete_all_display_disabilities') do
      service.disability_contention.delete_all_display_disabilities(150191)
    end
  end
end
