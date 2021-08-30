# frozen_string_literal: true

require 'bgs'

describe BGS::VnpBnftClaimService do
  let(:service) do
    BGS::Services.new(
      external_uid: 'something',
      external_key: 'something'
    )
  end

  let(:vnp_benefit_claim_create_params) do
    {
      jrn_dt: Time.now.iso8601,
      jrn_lctn_id: '281',
      jrn_user_id: 'VAgovAPI',
      jrn_obj_id: 'VAgovAPI',
      jrn_status_type_cd: 'U',
      vnp_proc_id: "3830249",
      claim_rcvd_dt: "2020-08-17T15:25:07Z",
      ptcpnt_clmant_id: "150191",
      ptcpnt_mail_addrs_id: "116942",
      vnp_ptcpnt_vet_id: "150191",
      status_type_cd: "CURR",
      svc_type_cd: "CP",
      pgm_type_cd: "COMP",
      bnft_claim_type_cd: "130DPNEBNADJ",
      claim_jrsdtn_lctn_id: "335",
      intake_jrsdtn_lctn_id: "335",
      atchms_ind: "N"
    }
  end

  let(:vnp_benfit_claim_update_params) do
    {
      jrn_dt: Time.now.iso8601,
      jrn_lctn_id: '281',
      jrn_user_id: 'VAgovAPI',
      jrn_obj_id: 'VAgovAPI',
      jrn_status_type_cd: 'U',
      vnp_proc_id: "3830252",
      vnp_bnft_claim_id: "426094",
      bnft_claim_type_cd: "130DPNEBNADJ",
      claim_rcvd_dt: "2020-08-17T15:44:50Z",
      bnft_claim_id: "600200323",
      intake_jrsdtn_lctn_id: "335",
      claim_jrsdtn_lctn_id: "335",
      pgm_type_cd: "CPL",
      ptcpnt_clmant_id: "150197",
      status_type_cd: "PEND",
      svc_type_cd: "CP"
    }
  end

  describe '#vnp_benefit_claim_create' do
    it 'creates and returns a vnp_benefit_claim' do
      VCR.use_cassette('vnp_benefit_claim/create') do
        response = service.vnp_bnft_claim.vnp_bnft_claim_create(vnp_benefit_claim_create_params)

        expect(response).to include(
          {
            :vnp_bnft_claim_id=>"426090",
            :atchms_ind=>"N",
            :bnft_claim_type_cd=>"130DPNEBNADJ",
            :ptcpnt_clmant_id=>"150191",
            :ptcpnt_mail_addrs_id=>"116942",
            :vnp_ptcpnt_vet_id=>"150191",
            :vnp_proc_id=>"3830249"
          }
        )
      end
    end
  end

    describe '#vnp_benefit_claim_update' do
    it 'updates and returns a vnp_benefit_claim' do
      VCR.use_cassette('vnp_benefit_claim/update') do
        response = service.vnp_bnft_claim.vnp_bnft_claim_update(vnp_benfit_claim_update_params)

        expect(response).to include(
          {
            :vnp_bnft_claim_id=>"426094",
            :ptcpnt_clmant_id=>"150197",
            :status_type_cd=>"PEND",
            :svc_type_cd=>"CP",
            :vnp_proc_id=>"3830252",
            :bnft_claim_id=>"600200323"
          }
        )
      end
    end
  end
end
