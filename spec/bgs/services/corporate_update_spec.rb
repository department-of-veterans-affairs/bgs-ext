# frozen_string_literal: true

require 'bgs'

describe BGS::CorporateUpdateWebService do
  let(:poa_code) { 'A1Q' }
  let(:participant_id) { '600043201' }
  let(:service) do
    BGS::Services.new(
      external_uid: 'something',
      external_key: 'something'
    )
  end

  it 'updates poa access' do
    VCR.use_cassette('corporate_update/update_poa_access') do
      response = service.corporate_update.update_poa_access(
        participant_id: participant_id,
        poa_code: poa_code
      )

      expect(response[:allow_poa_cadd]).to eq('y')
      expect(response[:audit_related_ar]).to eq(nil)
      expect(response[:award_bene_indicator]).to eq('$')
      expect(response[:email_address]).to eq('mytest@hotmail.com')
      expect(response[:file_number]).to eq('796130115')
      expect(response[:first_name]).to eq('TAMARA')
      expect(response[:gender]).to eq('F')
      expect(response[:ig_identifier]).to eq(nil)
      expect(response[:last_name]).to eq('ELLIS')
      expect(response[:middle_name]).to eq('E')
      expect(response[:poa]).to eq('A1Q')
      expect(response[:poa_name]).to eq('A1Q - PATRICIA E ROBERTS')
      expect(response[:ptcpnt_id]).to eq('600043201')
      expect(response[:rcvbl_indicator]).to eq('Y')
      expect(response[:return_code]).to eq('GUIE50000')
      expect(response[:return_message]).to eq('Success')
      expect(response[:sensitive]).to eq('U')
      expect(response[:ssn]).to eq('796130115')
      expect(response[:suffix]).to eq(nil)
      expect(response[:tax_abatement_indicator]).to eq(nil)
      expect(response[:title]).to eq(nil)
      expect(response[:verified_ssn]).to eq('N')
    end
  end
end
