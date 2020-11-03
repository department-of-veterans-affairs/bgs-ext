# frozen_string_literal: true

# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.

module BGS
  # This service gets information about a disability contention.
  class DisabilityContentionService < BGS::Base
    def bean_name
      'VDC'
    end

    def self.service_name
      'disability_contention'
    end

    # readAllContentions
    #   This service is used to find all the contentions information.
    def read_all_contentions(participant_id)
      response = request(:read_all_contentions, 'ptcpntIdVO': { 'vnpPtcpntId': participant_id })
      response.body[:contention_return_list]
    end

    # readAllDisplayDisabilities
    #   This service is used to find all the display disabilities information.
    def read_all_display_disabilities(participant_id)
      response = request(:read_all_display_disabilities, 'ptcpntId': participant_id)
      response.body[:disability_list]
    end

    # addContention
    #   This service is used to add contention data.
    def add_contention
      # TODO
    end

    # addDisplayDisability
    #   This service is used to add the display disability.
    def add_display_disability
      # TODO
    end

    # deleteAllContentions
    #   This service is used to delete all contentions
    def delete_all_contentions
      # TODO
    end

    # deleteAllDisplayDisabilities
    #   This service is used to delete all display contention.
    def delete_all_display_disabilities
      # TODO
    end

    # updateContention
    #   This service is used to update the contentions.
    def update_contention
      # TODO
    end

    # updateAllContention
    #   This service is used to update all the contentions.
    def update_all_contention
      # TODO
    end
  end
end
