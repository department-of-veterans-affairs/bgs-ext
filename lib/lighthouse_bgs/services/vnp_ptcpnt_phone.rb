module LighthouseBGS
  class VnpPtcpntPhoneService < LighthouseBGS::Base
    def bean_name
      'VnpPtcpntPhoneServiceBean'
    end

    def self.service_name
      'vnp_ptcpnt_phone'
    end

    def vnp_ptcpnt_phone_create(
      vnp_ptcpnt_phone_id:,
      vnp_proc_id:,
      vnp_ptcpnt_id:,
      phone_type_nm:,
      phone_nbr:,
      efctv_dt:,
      end_dt:,
      area_nbr:,
      cntry_nbr:,
      frgn_phone_rfrnc_txt:,
      extnsn_nbr:,
      jrn_dt:,
      jrn_lctn_id:,
      jrn_user_id:,
      jrn_status_type_cd:,
      jrn_obj_id:,
      ssn:
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

      response.body['vnp_ptcpnt_phone_create_response']['return']
    end
  end
end
