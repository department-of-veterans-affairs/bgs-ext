# frozen_string_literal: true

# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.

module LighthouseBGS
  class VnpPtcpntService < LighthouseBGS::Base
    def bean_name
      'VnpPtcpntServiceBean'
    end

    def self.service_name
      'vnp_ptcpnt'
    end

    def vnp_ptcpnt_create(
      vnp_ptcpnt_id:,
      vnp_proc_id:,
      fraud_ind:,
      jrn_dt:,
      jrn_lctn_id:,
      jrn_obj_id:,
      jrn_status_type_cd:,
      jrn_user_id:,
      legacy_poa_cd:,
      misc_vendor_ind:,
      ptcpnt_short_nm:,
      ptcpnt_type_nm:,
      tax_idfctn_nbr:,
      tin_waiver_reason_type_cd:,
      ptcpnt_fk_ptcpnt_id:,
      corp_ptcpnt_id:,
      ssn:
      )

      response = request(
        :vnp_ptcpnt_create,
        {
          "arg0": {
            "vnpPtcpntId": vnp_ptcpnt_id,
            "vnpProcId": vnp_proc_id,
            "fraudInd": fraud_ind,
            "jrnDt": jrn_dt,
            "jrnLctnId": jrn_lctn_id,
            "jrnObjId": jrn_obj_id,
            "jrnStatusTypeCd": jrn_status_type_cd,
            "jrnUserId": jrn_user_id,
            "legacyPoaCd": legacy_poa_cd,
            "miscVendorInd": misc_vendor_ind,
            "ptcpntShortNm": ptcpnt_short_nm,
            "ptcpntTypeNm": ptcpnt_type_nm,
            "taxIdfctnNbr": tax_idfctn_nbr,
            "tinWaiverReasonTypeCd": tin_waiver_reason_type_cd,
            "ptcpntFkPtcpntId": ptcpnt_fk_ptcpnt_id,
            "corpPtcpntId": corp_ptcpnt_id
          }
        },
        ssn
      )

      response.body[:vnp_ptcpnt_create][:return]
    end
  end
end

