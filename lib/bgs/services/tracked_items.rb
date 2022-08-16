# frozen_string_literal: true

# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.

module BGS
  # This service is used to get tracked items for a claim.
  class TrackedItemsService < BGS::Base
    def self.service_name
      'tracked_items'
    end

    def bean_name
      'TrackedItemService'
    end

    def find_tracked_items(claim_id)
      response = request(:find_tracked_items, claimId: claim_id)
      response.body[:find_tracked_items_response]
    end
  end
end
