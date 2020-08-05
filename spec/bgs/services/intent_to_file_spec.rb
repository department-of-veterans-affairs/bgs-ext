# frozen_string_literal: true

require 'bgs'

# rubocop:disable Metrics/BlockLength
describe BGS::IntentToFileWebService do
  let(:file_number) { '123456789' }
  let(:service) do
    BGS::Services.new(
      external_uid: 'something',
      external_key: 'something'
    )
  end

  context 'it should properly process intent to file requests' do
    it 'get find_intent_to_file_by_participant_id' do
      VCR.use_cassette('intent_to_file/find_intent_to_file_by_participant_id') do
        response = service.intent_to_file.find_intent_to_file_by_participant_id('13367440')
        last_itf = response.last
        expect(response.size).to eq(3203)
        expect(last_itf[:submtr_applcn_type_cd]).to eq('VETS.GOV')
        expect(last_itf[:intent_to_file_id]).to eq('183778')
        expect(last_itf[:itf_status_type_cd]).to eq('Duplicate')
        expect(last_itf[:itf_type_cd]).to eq('C')
        expect(last_itf[:jrn_dt].to_s).to eq('2020-07-21T11:03:41-05:00')
        expect(last_itf[:jrn_extnl_key_txt]).to eq('dslogon.1013590059')
        expect(last_itf[:jrn_extnl_user_id]).to eq('dslogon.1013590059')
        expect(last_itf[:jrn_lctn_id]).to eq('281')
        expect(last_itf[:jrn_obj_id]).to eq('eBenefits')
        expect(last_itf[:jrn_status_type_cd]).to eq('I')
        expect(last_itf[:jrn_user_id]).to eq('VAEBENEFITS')
        expect(last_itf[:ptcpnt_clmant_id]).to eq('13367440')
        expect(last_itf[:ptcpnt_vet_id]).to eq('13367440')
      end
    end

    it 'post insert_intent_to_file' do
      VCR.use_cassette('intent_to_file/insert_intent_to_file') do
        options = {
          intent_to_file_type_code: 'C',
          participant_claimant_id: 13367440,
          participant_vet_id: 13367440,
          received_date: '2020-08-04T10:11:14-06:00',
          signature_indicated: 'N',
          submitter_application_icn_type_code: 'VETS.GOV'
        }
        response = service.intent_to_file.insert_intent_to_file(options)
        expect(response[:create_dt].to_s).to eq('2020-08-05T10:48:27-05:00')
        expect(response[:exprtn_dt].to_s).to eq('2021-08-04T11:11:14-05:00')
        expect(response[:intent_to_file_id]).to eq('184000')
        expect(response[:itf_status_type_cd]).to eq('Incomplete')
        expect(response[:itf_type_cd]).to eq('C')
        expect(response[:jrn_dt].to_s).to eq('2020-08-05T10:48:27-05:00')
        expect(response[:jrn_extnl_key_txt]).to eq('something')
        expect(response[:jrn_extnl_user_id]).to eq('something')
        expect(response[:jrn_lctn_id]).to eq('281')
        expect(response[:jrn_obj_id]).to eq('VAgovAPI')
        expect(response[:jrn_status_type_cd]).to eq('I')
        expect(response[:jrn_user_id]).to eq('VAgovAPI')
        expect(response[:ptcpnt_clmant_id]).to eq('13367440')
        expect(response[:ptcpnt_vet_id]).to eq('13367440')
        expect(response[:rcvd_dt].to_s).to eq('2020-08-04T11:11:14-05:00')
        expect(response[:signtr_ind]).to eq('N')
        expect(response[:status_dt].to_s).to eq('2020-08-05T10:48:27-05:00')
        expect(response[:submtr_applcn_type_cd]).to eq('VETS.GOV')
      end
    end

    # it 'put update_intent_to_file' do
    #   # VCR.use_cassette("intent_to_file/update_intent_to_file") do
    #   #   response = Net::HTTP.get_response(URI('http://www.google.com'))
    #   # end
    # end
  end
end
