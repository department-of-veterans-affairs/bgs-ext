# frozen_string_literal: true

# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.

module BGS
    class VeteranRepresentativeService < BGS::Base
    #   def bean_name
    #     'VeteranRepresentativeService'
    #   end
      def bean_name
        'VDC'
      end

      def self.service_name
        'veteran_representative'
      end
  
      def read_all_veteran_representatives(form_type_code:, veteran_corp_ptcpnt_id:)
        response = request(
          :read_all_veteran_representatives,
          {
            "ns0:CorpPtcpntIdFormTypeCode": {
              "formTypeCode": form_type_code,
              "veteranCorpPtcpntId": veteran_corp_ptcpnt_id
            }
          },
          veteran_corp_ptcpnt_id
        )
        response.body[:read_all_veteran_representatives_response][:return]
      end
    end
  end
  