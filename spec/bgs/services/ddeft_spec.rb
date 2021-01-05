# frozen_string_literal: true

require 'bgs'

describe BGS::DdeftWebService do
  let(:service) do
    BGS::Services.new(
      external_uid: 'something',
      external_key: 'something'
    )
  end

  describe '#find_bank_name_by_routng_trnsit_nbr' do
    it 'returns bank name when given a valid routing number' do
      VCR.use_cassette('ddeft/find_bank_name_valid') do
        res = service.ddeft.find_bank_name_by_routng_trnsit_nbr('122400724')
        expect(res[:find_bank_name_by_routng_trnsit_nbr_response][:return][:bank_name]).to eq(
          'BANK OF AMERICA, N.A.'
        )
      end
    end

    it 'raises an exception when given an invalid routing number' do
      VCR.use_cassette('ddeft/find_bank_name_invalid_routing') do
        expect do
          service.ddeft.find_bank_name_by_routng_trnsit_nbr('2222')
        end.to raise_error(Savon::SOAPFault)
      end
    end
  end
end
