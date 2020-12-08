# frozen_string_literal: true

require 'bgs'

describe BGS::ContentionService do
  let(:service) do
    BGS::Services.new(
      external_uid: 'something',
      external_key: 'something'
    )
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
