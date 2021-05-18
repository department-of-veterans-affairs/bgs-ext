# frozen_string_literal: true

# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.

module BGS
  class CorporateUpdateWebService < BGS::Base
    def self.service_name
      'corporate_update'
    end

    def bean_name
      'CorporateUpdateServiceBean'
    end

    # update a POA relationship
    def update_poa_access(participant_id:, poa_code:, allow_poa_access: 'y', allow_poa_c_add: 'y')
      response = request(
        :update_poa_access,
        {
          "ptcpntId": participant_id,
          "poa": poa_code,
          "allowPoaAccess": allow_poa_access,
          "allowPoaCadd": allow_poa_c_add
        }
      )
      response.body[:update_poa_access_response][:return]
    end
  end
end
