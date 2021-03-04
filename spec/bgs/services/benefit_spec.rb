# frozen_string_literal: true

require 'bgs'
require 'byebug'

describe BGS::BenefitClaimWebService do
  let(:service) do
    BGS::Services.new(
      external_uid: 'something',
      external_key: 'something'
    )
  end

  it 'get find_by_vbms_file_number' do
    VCR.use_cassette('benefit/find_by_vbms_file_number') do
      response = service.claims.find_by_vbms_file_number('546212222')
      expect(response.count).to eq(19)

      first_claim = response.first
      expect(first_claim[:benefit_claim_id]).to eq('600202611')
      expect(first_claim[:claim_receive_date]).to eq('09/04/2020')
      expect(first_claim[:claim_type_code]).to eq('590SFUFE')
      expect(first_claim[:claim_type_name]).to eq('Scheduled Follow-Up Field Exam')
      expect(first_claim[:claimant_first_name]).to eq('SAM')
      expect(first_claim[:claimant_last_name]).to eq('JAKES')
      expect(first_claim[:claimant_middle_name]).to eq(nil)
      expect(first_claim[:claimant_suffix]).to eq(nil)
      expect(first_claim[:end_product_type_code]).to eq('590')
      expect(first_claim[:last_action_date]).to eq(nil)
      expect(first_claim[:organization_name]).to eq(nil)
      expect(first_claim[:organization_title_type_name]).to eq(nil)
      expect(first_claim[:payee_type_code]).to eq('00')
      expect(first_claim[:person_or_organization_indicator]).to eq('P')
      expect(first_claim[:program_type_code]).to eq('CPL')
      expect(first_claim[:status_type_code]).to eq('PEND')
    end
  end
end
