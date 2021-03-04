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
    VCR.use_cassette('benefit_dos/find_bnft_claim') do
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
end
