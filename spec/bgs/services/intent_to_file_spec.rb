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

    it 'put update_intent_to_file' do
      VCR.use_cassette('intent_to_file/update_intent_to_file') do
        options = {
          intent_to_file_id: 184000,
          intent_to_file_type_code: 'C',
          participant_claimant_id: 13367440,
          intent_to_file_status_code: 'Active',
          participant_vet_id: 13367440,
          received_date: '2020-08-04T10:11:14-06:00',
          submitter_application_icn_type_code: 'VETS.GOV'
        }
        response = service.intent_to_file.update_intent_to_file(options)
        expect(response[:exprtn_dt].to_s).to eq('2021-08-04T11:11:14-05:00')
        expect(response[:intent_to_file_id]).to eq('184000')
        expect(response[:itf_status_type_cd]).to eq('Active')
        expect(response[:itf_type_cd]).to eq('C')
        expect(response[:jrn_dt].to_s).to eq('2020-08-05T18:57:49-05:00')
        expect(response[:jrn_extnl_key_txt]).to eq('something')
        expect(response[:jrn_extnl_user_id]).to eq('something')
        expect(response[:jrn_lctn_id]).to eq('281')
        expect(response[:jrn_obj_id]).to eq('VAgovAPI')
        expect(response[:jrn_status_type_cd]).to eq('U')
        expect(response[:jrn_user_id]).to eq('VAgovAPI')
        expect(response[:ptcpnt_clmant_id]).to eq('13367440')
        expect(response[:ptcpnt_vet_id]).to eq('13367440')
        expect(response[:rcvd_dt].to_s).to eq('2020-08-04T11:11:14-05:00')
        expect(response[:status_dt].to_s).to eq('2020-08-05T18:57:49-05:00')
        expect(response[:submtr_applcn_type_cd]).to eq('VETS.GOV')
      end
    end

    it 'get find_intent_to_file_by_participant_id with type' do
      VCR.use_cassette('intent_to_file/find_intent_to_file_by_participant_id_itf_type_cd') do
        response = service.intent_to_file.find_intent_to_file_by_ptcpnt_id_itf_type_cd('13367440', 'P')
        expect(response[:clmant_addrs_one_txt]).to eq('123 WEST HIGH PKWY')
        expect(response[:clmant_addrs_two_txt]).to eq('SUITE 100')
        expect(response[:clmant_city_nm]).to eq('FAIRFAX')
        expect(response[:clmant_cntry_nm]).to eq('USA')
        expect(response[:clmant_first_nm]).to eq('Mark')
        expect(response[:clmant_last_nm]).to eq('Webb')
        expect(response[:clmant_phone_area_nbr]).to eq('202')
        expect(response[:clmant_phone_nbr]).to eq('3333331')
        expect(response[:clmant_ssn]).to eq('796104437')
        expect(response[:clmant_state_cd]).to eq('VA')
        expect(response[:clmant_zip_cd]).to eq('22314')
        expect(response[:create_dt].to_s).to eq('2020-01-08T12:05:37-06:00')
        expect(response[:exprtn_dt].to_s).to eq('2021-01-08T12:05:35-06:00')
        expect(response[:gender_cd]).to eq('M')
        expect(response[:intent_to_file_id]).to eq('180347')
        expect(response[:itf_status_type_cd]).to eq('Active')
        expect(response[:itf_type_cd]).to eq('P')
        expect(response[:jrn_dt].to_s).to eq('2020-01-08T12:05:37-06:00')
        expect(response[:jrn_lctn_id]).to eq('328')
        expect(response[:jrn_obj_id]).to eq('CRMUD')
        expect(response[:jrn_status_type_cd]).to eq('I')
        expect(response[:jrn_user_id]).to eq('281TUSER06')
        expect(response[:ptcpnt_clmant_id]).to eq('13367440')
        expect(response[:ptcpnt_vet_id]).to eq('13367440')
        expect(response[:rcvd_dt].to_s).to eq('2020-01-08T12:05:35-06:00')
        expect(response[:signtr_ind]).to eq('Y')
        expect(response[:status_dt].to_s).to eq('2020-01-08T12:05:37-06:00')
        expect(response[:submtr_applcn_type_cd]).to eq('CRM')
        expect(response[:vet_file_nbr]).to eq('796104437')
        expect(response[:vet_first_nm]).to eq('Mark')
        expect(response[:vet_last_nm]).to eq('Webb')
        expect(response[:vet_ssn_nbr]).to eq('796104437')
      end
    end

    it 'no thingy' do
      VCR.use_cassette('intent_to_file/find_intent_to_file_by_participant_id_no') do
        options = {
          intent_to_file_type_code: 'C',
          participant_claimant_id: 13367440,
          participant_vet_id: 13367440,
          received_date: '2020-08-04T10:11:14-06:00',
          submitter_application_icn_type_code: 'VETS.GOV'
        }
        service.intent_to_file.insert_intent_to_file(options)
      end
    end
  end

  context 'validating required fields' do
    context "for 'insert_intent_to_file'" do
      required_fields = %i[
        intent_to_file_type_code
        participant_vet_id
        received_date
        submitter_application_icn_type_code
      ]

      hash = {
        intent_to_file_type_code: 'hello_world',
        participant_vet_id: 'hello_world',
        received_date: 'hello_world',
        submitter_application_icn_type_code: 'hello_world'
      }

      context 'when a required field is missing' do
        required_fields.each do |required_field|
          it "raises an 'ArgumentError' for missing required field" do
            options = hash.clone
            options.delete(required_field)

            expect { service.intent_to_file.insert_intent_to_file(options) }
              .to raise_error(
                ArgumentError,
                "#{required_field} is a required key in insert_intent_to_file"
              )
          end
        end
      end

      context 'when a required field is blank' do
        required_fields.each do |required_field|
          it "raises an 'ArgumentError' for missing required field" do
            options = hash.clone
            options[required_field] = ''

            expect { service.intent_to_file.insert_intent_to_file(options) }
              .to raise_error(
                ArgumentError,
                "#{required_field} cannot be empty or nil"
              )
          end
        end
      end

      context 'when a required field is nil' do
        required_fields.each do |required_field|
          it "raises an 'ArgumentError' for missing required field" do
            options = hash.clone
            options[required_field] = nil

            expect { service.intent_to_file.insert_intent_to_file(options) }
              .to raise_error(
                ArgumentError,
                "#{required_field} cannot be empty or nil"
              )
          end
        end
      end
    end
  end

  context 'validating condtionally required fields' do
    context "for 'insert_intent_to_file'" do
      hash = {
        intent_to_file_type_code: 'hello_world',
        participant_vet_id: 'hello_world',
        received_date: 'hello_world',
        submitter_application_icn_type_code: 'hello_world'
      }

      context "when a 'participant_claimant_id' is not provided" do
        context "and the 'claimant_ssn' is not provided" do
          it "raises an 'ArgumentError' for missing required field" do
            options = hash.clone

            expect { service.intent_to_file.insert_intent_to_file(options) }
              .to raise_error(
                ArgumentError,
                "Must include either 'participant_claimant_id' or 'claimant_ssn'"
              )
          end
        end
      end
    end
  end
end
