# frozen_string_literal: true

# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.

module LighthouseBGS
  class VnpPtcpntService < LighthouseBGS::Base
    def bean_name
      'VnpProcFormWebServiceBean'
    end

    def self.service_name
      'vnp_ptcpnt'
    end

    def vnp_ptcpnt_create(ssn:)
      response = request(
        :vnp_ptcpnt_create,
        {
          "arg0": {
            "compId": {
              "vnpProcId": vnp_proc_id,
              "formTypeCd": form_type_cd
            },
            "jrnDt": jrn_dt,
            "jrnLctnId": jrn_lctn_id,
            "jrnObjId": jrn_obj_id,
            "jrnStatusTypeCd": jrn_status_type_cd,
            "jrnUserId": jrn_user_id
          },
          ssn
        }
      )

      response.body[:vnp_ptcpnt_create][:return]
    end
  end
end