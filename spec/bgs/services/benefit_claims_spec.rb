# frozen_string_literal: true

require 'bgs'

describe BGS::BenefitClaimWebService2 do
  let(:service) do
    BGS::Services.new(
      external_uid: 'something',
      external_key: 'something'
    )
  end

  it 'get find_bnft_claim' do
    VCR.use_cassette('benefit_claims/find_bnft_claim') do
      claim = service.benefit_claims.find_bnft_claim('600202611')

      expect(claim[:bnft_claim_id]).to eq('600202611')
      expect(claim[:bnft_claim_type_cd]).to eq('590SFUFE')
      expect(claim[:bnft_claim_type_label]).to eq('Fiduciary')
      expect(claim[:bnft_claim_type_nm]).to eq('Scheduled Follow-Up Field Exam')
      expect(claim[:bnft_claim_user_display]).to eq('NO')
      expect(claim[:claim_jrsdtn_lctn_id]).to eq('123725')
      expect(claim[:claim_rcvd_dt]).to eq(DateTime.parse('2020-09-04T00:00:00-05:00'))
      expect(claim[:claim_suspns_dt]).to eq(DateTime.parse('2020-09-03T19:00:00-05:00'))
      expect(claim[:cp_claim_end_prdct_type_cd]).to eq('590')
      expect(claim[:jrn_dt]).to eq(DateTime.parse('2020-09-08T14:06:22-05:00'))
      expect(claim[:jrn_lctn_id]).to eq('330')
      expect(claim[:jrn_obj_id]).to eq('VBMS  - CEST')
      expect(claim[:jrn_status_type_cd]).to eq('U')
      expect(claim[:jrn_user_id]).to eq('HAYWARD_A_FDEX')
      expect(claim[:payee_type_cd]).to eq('00')
      expect(claim[:payee_type_nm]).to eq('Veteran')
      expect(claim[:pgm_type_cd]).to eq('CPL')
      expect(claim[:pgm_type_nm]).to eq('Compensation-Pension Live')
      expect(claim[:ptcpnt_clmant_id]).to eq('13014883')
      expect(claim[:ptcpnt_clmant_nm]).to eq('JAKES SAM')
      expect(claim[:ptcpnt_dposit_acnt_id]).to eq('24250')
      expect(claim[:ptcpnt_mail_addrs_id]).to eq('15451325')
      expect(claim[:ptcpnt_vet_id]).to eq('13014883')
      expect(claim[:station_of_jurisdiction]).to eq('499')
      expect(claim[:status_type_cd]).to eq('PEND')
      expect(claim[:status_type_nm]).to eq('Pending')
      expect(claim[:svc_type_cd]).to eq('CP')
      expect(claim[:temp_jrsdtn_lctn_id]).to eq('359')
      expect(claim[:temporary_station_of_jurisdiction]).to eq('330')
      expect(claim[:termnl_digit_nbr]).to eq('22')
    end
  end

  it 'post update_bnft_claim' do
    VCR.use_cassette('benefit_claims/update_bnft_claim') do
      service.benefit_claims.update_bnft_claim({ bnft_claim_id: '600202611',
                                                 bnft_claim_type_cd: '590SFUFE',
                                                 bnft_claim_type_label: 'Fiduciary',
                                                 bnft_claim_type_nm: 'Scheduled Follow-Up Field Exam',
                                                 bnft_claim_user_display: 'NO',
                                                 claim_jrsdtn_lctn_id: '123725',
                                                 claim_rcvd_dt: DateTime.parse('2020-09-04T00:00:00-05:00'),
                                                 claim_suspns_dt: DateTime.parse('2020-09-03T19:00:00-05:00'),
                                                 cp_claim_end_prdct_type_cd: '590',
                                                 jrn_dt: DateTime.parse('2020-09-08T14:06:22-05:00'),
                                                 jrn_lctn_id: '330',
                                                 jrn_obj_id: 'VBMS  - CEST',
                                                 jrn_status_type_cd: 'U',
                                                 jrn_user_id: 'LIGHTHOUSE',
                                                 payee_type_cd: '00',
                                                 payee_type_nm: 'Veteran',
                                                 pgm_type_cd: 'CPL',
                                                 pgm_type_nm: 'Compensation-Pension Live',
                                                 ptcpnt_clmant_id: '13014883',
                                                 ptcpnt_clmant_nm: 'JAKES SAM',
                                                 ptcpnt_dposit_acnt_id: '24250',
                                                 ptcpnt_mail_addrs_id: '15451325',
                                                 ptcpnt_vet_id: '13014883',
                                                 station_of_jurisdiction: '499',
                                                 status_type_cd: 'PEND',
                                                 status_type_nm: 'Pending',
                                                 svc_type_cd: 'CP',
                                                 temp_jrsdtn_lctn_id: '359',
                                                 temporary_station_of_jurisdiction: '330',
                                                 termnl_digit_nbr: '22' })
    end
  end
end
