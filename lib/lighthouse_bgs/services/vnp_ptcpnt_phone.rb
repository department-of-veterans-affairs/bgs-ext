# frozen_string_literal: true

# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.

module LighthouseBGS
  class VnpPtcpntPhoneService < LighthouseBGS::Base
    def bean_name
      'VnpPtcpntPhoneWebServiceBean'
    end

    def self.service_name
      'vnp_ptcpnt_phone'
    end

    def vnp_ptcpnt_phone_create(
      vnp_proc_id:,
      jrn_dt:,
      jrn_lctn_id:,
      jrn_user_id:,
      jrn_status_type_cd:,
      jrn_obj_id:,
      vnp_ptcpnt_id:,
      phone_type_nm:,
      phone_nbr:,
      efctv_dt:,
      vnp_ptcpnt_phone_id: nil,
      end_dt: nil,
      area_nbr: nil,
      cntry_nbr: nil,
      frgn_phone_rfrnc_txt: nil,
      extnsn_nbr: nil,
      ssn: # Just here to make mocks work
    )

      response = request(
        :vnp_ptcpnt_phone_create,
        {
          "arg0": {
            vnpPtcpntPhoneId: vnp_ptcpnt_phone_id,
            vnpProcId: vnp_proc_id,
            vnpPtcpntId: vnp_ptcpnt_id,
            phoneTypeNm: phone_type_nm,
            phoneNbr: phone_nbr,
            efctvDt: efctv_dt,
            endDt: end_dt,
            areaNbr: area_nbr,
            cntryNbr: cntry_nbr,
            frgnPhoneRfrncTxt: frgn_phone_rfrnc_txt,
            extnsnNbr: extnsn_nbr,
            jrnDt: jrn_dt,
            jrnLctnId: jrn_lctn_id,
            jrnUserId: jrn_user_id,
            jrnStatusTypeCd: jrn_status_type_cd,
            jrnObjId: jrn_obj_id
          }
        },
        ssn
      )

      response.body[:vnp_ptcpnt_phone_create_response][:return]
    end
  end
end
