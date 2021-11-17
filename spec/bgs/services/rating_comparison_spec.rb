# frozen_string_literal: true

require 'bgs'
require 'byebug'

describe BGS::RatingService do
  let(:service) do
    BGS::Services.new(
      external_uid: 'something',
      external_key: 'something'
    )
  end

  describe '#find_by_participant_id_and_date_range' do
    it 'returns response' do
      VCR.use_cassette('rating/find_by_participant_id_and_date_range', record: :all) do
        response = service.rating_comparison.find_by_participant_id_and_date_range(
          '796123232', Date.new(2011, 12, 31), Date.today.to_date
        )
        # response = service.rating_comparison.find_by_participant_id_and_date_range(
        #  '600043201', Date.new(2011, 12, 31), Date.today.to_date
        # )
        binding.pry
      end
    end
  end
end
