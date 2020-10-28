# frozen_string_literal: true

require 'bgs'

describe BGS::VetRecordWebService do
  let(:service) do
    BGS::Services.new(
      external_uid: 'something',
      external_key: 'something'
    )
  end

  it 'put update_birls_record' do
    VCR.use_cassette('vet_record/update_birls_record') do
      response = service.vet_record.update_birls_record(ssn: '796123232', poa_code: 'A1Q')

      expect(response[:return_code]).to eq('BMOD0001')
      expect(response[:return_message]).to eq('BIRLS Update successful')
      expect(response[:space]).to be_nil
      expect(response[:claim_number]).to eq('796123232')
      expect(response[:soc_sec_number]).to eq('796123232')
      expect(response[:ins_prefix]).to be_nil
      expect(response[:ins_number]).to be_nil
      expect(response[:last_name]).to eq('KELLY')
      expect(response[:first_name]).to eq('LEWIS')
      expect(response[:middle_name]).to eq('L')
      expect(response[:name_suffix]).to be_nil
      expect(response[:birth_month]).to eq('09')
      expect(response[:birth_day]).to eq('08')
      expect(response[:birth_century]).to eq('19')
      expect(response[:birth_year]).to eq('54')
      expect(response[:date_of_birth]).to eq('09/08/1954')
      expect(response[:date_of_birth]).to eq('09/08/1954')
      expect(response[:death_month]).to be_nil
      expect(response[:death_day]).to be_nil
      expect(response[:death_century]).to be_nil
      expect(response[:death_year]).to be_nil
      expect(response[:date_of_death]).to be_nil
      expect(response[:pow_number_of_days]).to be_nil
      expect(response[:total_active_service_years]).to be_nil
      expect(response[:total_active_service_months]).to be_nil
      expect(response[:total_active_service_days]).to be_nil
      expect(response[:disability_severance_pay]).to be_nil
      expect(response[:lump_sum_readjustment_pay]).to be_nil
      expect(response[:separation_pay]).to be_nil

      # These expectations are non exhaustive of the entire response. To see the full
      # response print with `puts response.inspect` while running the specs.
    end
  end

  describe 'get find_corporate_record' do
    context 'when no records are returned' do
      it 'returns a valid response' do
        VCR.use_cassette('vet_record/find_corporate_record') do
          response = service.vet_record.find_corporate_record(first_name: 'KELLY', last_name: 'LEWIS')

          expect(response[:number_of_records].strip).to eq('0')
          expect(response[:return_code]).to eq('PSN 0 00E')
          expect(response[:return_message]).to eq('Records found')
        end
      end
    end
  end
end
