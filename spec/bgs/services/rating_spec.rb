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

  describe '#find_rating_data' do
    it 'returns a valid regional office response' do
      VCR.use_cassette('rating/find_rating_data', :record => :all) do
        response = service.rating.find_rating_data('796123232')
        binding.pry
      end
    end
  end
end
