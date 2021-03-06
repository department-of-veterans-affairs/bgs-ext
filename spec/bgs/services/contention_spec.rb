# frozen_string_literal: true

require 'bgs'

describe BGS::ContentionService do
  let(:service) do
    BGS::Services.new(
      external_uid: 'something',
      external_key: 'something'
    )
  end

  it 'get find_contentions_by_ptcpnt_id' do
    VCR.use_cassette('contention/find_contentions_by_ptcpnt_id') do
      response = service.contention.find_contentions_by_ptcpnt_id('600036156')
      expect(response[:benefit_claims].count).to eq(289)

      first_claim = response[:benefit_claims].first
      expect(first_claim[:call_id]).to eq('17')
      expect(first_claim[:jrn_lctn_id]).to eq('281')
      expect(first_claim[:jrn_obj_id]).to eq('EBENEFITS  - CEST')
      expect(first_claim[:jrn_stt_tc]).to eq('I')
      expect(first_claim[:jrn_user_id]).to eq('VAEBENEFITS')
      expect(first_claim[:name]).to eq('BenefitClaim')
      expect(first_claim[:row_cnt]).to eq('289')
      expect(first_claim[:row_id]).to eq('1736')
      expect(first_claim[:bnft_clm_tc]).to eq('400SUPP')
      expect(first_claim[:bnft_clm_tn]).to eq('eBenefits 526EZ-Supplemental (400)')
      expect(first_claim[:clm_id]).to eq('600100330')
      expect(first_claim[:clm_suspns_cd]).to eq('056')
      expect(first_claim[:lc_stt_rsn_tc]).to eq('CAN')
      expect(first_claim[:lc_stt_rsn_tn]).to eq('Cancelled')
      expect(first_claim[:lctn_id]).to eq('322')
      expect(first_claim[:non_med_clm_desc]).to eq('eBenefits 526EZ-Supplemental (400)')
      expect(first_claim[:notes_ind]).to eq('1')
      expect(first_claim[:prirty]).to eq('0')
      expect(first_claim[:ptcpnt_id_clmnt]).to eq('600036156')
      expect(first_claim[:ptcpnt_id_vet]).to eq('600036156')
      expect(first_claim[:ptcpnt_suspns_id]).to eq('13381347')
      expect(first_claim[:soj_lctn_id]).to eq('347')
      expect(first_claim[:suspns_rsn_txt]).to eq('Cancelled')
    end
  end

  it 'post manage_contentions' do
    VCR.use_cassette('contention/manage_contentions') do
      service.contention.manage_contentions(
        jrn_dt: '2020-08-17T10:44:43-05:00',
        bnft_clm_tc: '130DPNEBNADJ',
        bnft_clm_tn: 'eBenefits Dependency Adjustment',
        claim_rcvd_dt: '2020-08-17T00:00:00-05:00',
        clm_id: '600200323',
        contentions: [
          {
            clm_id: '600200323',
            special_issues: [
              { spis_tc: 'POW' }
            ]
          }
        ],
        lc_stt_rsn_tc: 'OPEN',
        lc_stt_rsn_tn: 'Open',
        lctn_id: '322',
        non_med_clm_desc: 'eBenefits Dependency Adjustment',
        prirty: '0',
        ptcpnt_id_clmnt: '600036156',
        ptcpnt_id_vet: '600036156',
        ptcpnt_suspns_id: '600276939',
        soj_lctn_id: '347'
      )
    end
  end
end
