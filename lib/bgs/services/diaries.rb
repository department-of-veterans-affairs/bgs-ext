module BGS
  # This service is used to store information about individuals the VA is
  # interested in. This information may be kept permanently, removed or discarded
  # if appropriate.
  class DiariesService < BGS::Base
    def bean_name
      'benefits-awards'
    end

    def namespace
      { namespaces: { 'xmlns:data' => 'http://gov.va.vba.benefits.awards.ws/data' } }
    end

    def self.service_name
      'diaries'
    end

    def read_diaries(options)
      response = request(
        :read_diaries,
        {
          'data:AwardKeyInput': { 'awardType': 'CPL', 'beneficiaryID': options[:beneficiary_id], 'veteranID':  options[:beneficiary_id] }
        },
        options[:ssn]
      )

      response.body[:read_diaries_response][:diary_response]
    end
  end
end
