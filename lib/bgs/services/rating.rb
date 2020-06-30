# frozen_string_literal: true

# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.

module BGS
  # Used for finding historical data about ratings
  class RatingService < BGS::Base
    def bean_name
      'RatingServiceBean'
    end

    def self.service_name
      'rating'
    end

    # findRatingData (shrinqm)
    # This service provides the Rating Data. This service uses the following tuxedo services: shrinq1, shrinqm
    def find_rating_data(file_number)
      response = request(:find_rating_data, 'fileNumber': file_number)
      response.body[:find_rating_data_response][:return]
    end

  end
end
