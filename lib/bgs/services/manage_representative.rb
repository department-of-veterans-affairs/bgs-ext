# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.

module BGS
  # This service provides the VSO organization and POA details.
  #
  # updatePOARelationship    - Updates VNP tables with a new POA relationship based on actions taken within SEP.
  # It will also be used to update appropriate databases (Corporate and BIRLS) with a new POA relationship between a
  # Veteran and a VSO Organization or Personal Representative.
  #

  class ManageRepresentativeWebService < BGS::Base
    def self.service_name
      "manage_representative"
    end

    def update_poa_relationship(date_request_accepted, participant_id, ssn, poa_code)
      if mock_responses
        file_path = "#{BGS.configuration.mock_response_location}/manage_representative_service/update_poa_relationship/#{ssn}.json"
        if File.exists?(file_path)
          JSON.parse(File.read("#{BGS.configuration.mock_response_location}/manage_representative_service/update_poa_relationship/#{ssn}.json"))
        else
          puts "#{file_path} does not exist"
        end
      else
        response = request(
          :update_poa_relationship,
          "POARelationship": {
            "dateRequestAccepted": date_request_accepted,
            "vetPtcpntId": participant_id,
            "vetSSN": ssn,
            "vsoPOACode": poa_code
          }
        )
        response.body[:update_poa_relationship_response][:poa_relationship_return_vo]
      end
    end
  end
end
