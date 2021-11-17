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

  it '#find' do
    VCR.use_cassette('rating/find', record: :all) do
      response = service.rating_profile.find(
        participant_id: '600043201', profile_date: Date.new(2011, 12, 31).to_datetime
      )
      # response = service.rating_profile.find(
      #   participant_id: '600043201', profile_date: '2013-04-12T11:33:27-05:00'
      # )
      binding.pry
    end
  end

  it '#find_in_date_range' do
    VCR.use_cassette('rating/find_in_date_range', record: :all) do
      # TODO: use the profile_date from the find_in_date_range response
      response = service.rating_profile.find_in_date_range(
        participant_id: '600043201', start_date: Date.new(2011, 12, 31), end_date: Date.today.to_date
      )
      # response = service.rating_profile.find_in_date_range(
      #   participant_id: '600043201', profile_date: '2013-04-12T11:33:27-05:00'
      # )
      binding.pry
    end
  end

  it 'returns a rating profile by participant ID response' do
    VCR.use_cassette('rating/find_rating_profile_by_participant_id', record: :all) do
      response = service.rating_profile.find_current_rating_profile_by_ptcpnt_id('600043201')
      # response = service.rating_profile.find_current_rating_profile_by_ptcpnt_id(31164997)
      # response = service.rating_profile.find_current_rating_profile_by_ptcpnt_id(796123232)
      binding.pry
    end
  end
end
