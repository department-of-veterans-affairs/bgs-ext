module LighthouseBGS
  class VnpBnftClaimService < LighthouseBGS::Base
    def bean_name
      'VnpBnftClaimWebServiceBean'
    end

    def self.service_name
      'vnp_bnft_claim'
    end

    def vnp_bnft_claim_create(
      vnp_bnft_claim_id:,
      bnft_claim_type_cd:,
      claim_rcvd_dt:,
      jrn_dt:,
      jrn_lctn_id:,
      jrn_obj_id:,
      jrn_status_type_cd:,
      jrn_user_id:,
      pgm_type_cd:,
      ptcpnt_clmant_id:,
      status_type_cd:,
      svc_type_cd:,
      vnp_proc_id:,
      applcn_id: nil,
      atchms_ind: nil,
      claim_jrsdtn_lctn_id: nil,
      claim_suspns_dt: nil,
      end_prdct_type_cd: nil,
      infrml_ind: nil,
      intake_jrsdtn_lctn_id: nil,
      last_paid_dt: nil,
      payee_type_cd: nil,
      ptcpnt_dposit_acnt_id: nil,
      ptcpnt_vsr_id: nil,
      rmks_txt: nil,
      ptcpnt_mail_addrs_id: nil,
      ptcpnt_pymt_addrs_id: nil,
      termnl_digit_nbr: nil,
      vnp_ptcpnt_vet_id: nil,
      bnft_claim_id: nil,
      ssn:
    )

      response = request(
        :vnp_bnft_claim_create,
        {
          "arg0": {
            "vnpBnftClaimId": vnp_bnft_claim_id,
            "bnftClaimTypeCd": bnft_claim_type_cd,
            "claimRcvdDt": claim_rcvd_dt,
            "jrnDt": jrn_dt,
            "jrnLctnId": jrn_lctn_id,
            "jrnObjId": jrn_obj_id,
            "jrnStatusTypeCd": jrn_status_type_cd,
            "jrnUserId": jrn_user_id,
            "pgmTypeCd": pgm_type_cd,
            "ptcpntClmantId": ptcpnt_clmant_id,
            "statusTypeCd": status_type_cd,
            "svcTypeCd": svc_type_cd,
            "vnpProcID": vnp_proc_id,
            "applcnId": applcn_id,
            "atchmsInd": atchms_ind,
            "claimJrsdtnLctnId": claim_jrsdtn_lctn_id,
            "claimSuspnsDt": claim_suspns_dt,
            "endPrdctTypeCd": end_prdct_type_cd,
            "infrmlInd": infrml_ind,
            "intakeJrsdtnLctnId": intake_jrsdtn_lctn_id,
            "lastPaidDt": last_paid_dt,
            "payeeTypeCd": payee_type_cd,
            "ptcpntDpositAcntId": ptcpnt_dposit_acnt_id,
            "ptcpntVsrId": ptcpnt_vsr_id,
            "rmksTxt": rmks_txt,
            "ptcpntMailAddrsId": ptcpnt_mail_addrs_id,
            "ptcpntPymtAddrsId": ptcpnt_pymt_addrs_id,
            "termnlDigitNbr": termnl_digit_nbr,
            "vnpPtcpntVetId": vnp_ptcpnt_vet_id,
            "bnftClaimId": bnft_claim_id
          }
        },
        ssn
      )

      response.body[:vnp_bnft_claim_create_response][:return]
    end
  end
end
