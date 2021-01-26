# frozen_string_literal: true

require 'bgs'

describe BGS::DiariesService do
  let(:service) do
    BGS::Services.new(
      external_uid: 'something',
      external_key: 'something'
    )
  end

  let(:diary_params) { {beneficiary_id: 'something', ssn: 'something'} }

  describe '#read_diaries' do
    it 'returns vet diary information' do
      VCR.use_cassette('diaries/read_diaries') do
        response = service.diaries.read_diaries(diary_params)

        expect(response).to include({error_level: "0"})
      end
    end
  end
end
