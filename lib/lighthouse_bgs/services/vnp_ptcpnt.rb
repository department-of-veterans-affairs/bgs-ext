# frozen_string_literal: true

# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.

module LighthouseBGS
  class VnpPtcpntService < LighthouseBGS::Base
    def bean_name
      'VnpPtcpntWebServiceBean'
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

      response.body[:vnp_ptcpnt_create_response][:return]
    end

    def vnp_ptcpnt_addrs_create(
      vnp_ptcpnt_id:,
      vnp_proc_id:,
      addrs_one_txt:,
      addrs_three_txt:,
      addrs_two_txt:,
      bad_addrs_ind:,
      city_nm:,
      cntry_nm:,
      county_nm:,
      eft_waiver_type_nm:,
      email_addrs_txt:,
      end_dt:,
      fms_addrs_code_txt:,
      frgn_postal_cd:,
      group1_verifd_type_cd:,
      jrn_dt:,
      jrn_lctn_id:,
      jrn_obj_id:,
      jrn_status_type_cd:,
      jrn_user_id:,
      lctn_nm:,
      mlty_postal_type_cd:,
      mlty_post_office_type_cd:,
      postal_cd:,
      prvnc_nm:,
      ptcpnt_addrs_type_nm:,
      shared_addrs_ind:,
      trsury_addrs_five_txt:,
      trsury_addrs_four_txt:,
      trsury_addrs_one_txt:,
      trsury_addrs_six_txt:,
      trsury_addrs_three_txt:,
      trsury_addrs_two_txt:,
      trsury_seq_nbr:,
      trtry_nm:,
      zip_first_suffix_nbr:,
      zip_prefix_nbr:,
      zip_second_suffix_nbr:,
      ssn:
    )

      response = request(
        :vnp_ptcpnt_addrs_create,
        {
          "arg0": {
            vnpPtcpntId: vnp_ptcpnt_id,
            vnpProcId: vnp_proc_id,
            addrsOneTxt: addrs_one_txt,
            addrsThreeTxt: addrs_three_txt,
            addrsTwoTxt: addrs_two_txt,
            badAddrsInd: bad_addrs_ind,
            cityNm: city_nm,
            cntryNm: cntry_nm,
            countyNm: county_nm,
            eftWaiverTypeNm: eft_waiver_type_nm,
            emailAddrsTxt: email_addrs_txt,
            endDt: end_dt,
            fmsAddrsCodeTxt: fms_addrs_code_txt,
            frgnPostalCd: frgn_postal_cd,
            group1VerifdTypeCd: group1_verifd_type_cd,
            jrnDt: jrn_dt,
            jrnLctnId: jrn_lctn_id,
            jrnObjId: jrn_obj_id,
            jrnStatusTypeCd: jrn_status_type_cd,
            jrnUserId: jrn_user_id,
            lctnNm: lctn_nm,
            mltyPostalTypeCd: mlty_postal_type_cd,
            mltyPostOfficeTypeCd: mlty_post_office_type_cd,
            postalCd: postal_cd,
            prvncNm: prvnc_nm,
            ptcpntAddrsTypeNm: ptcpnt_addrs_type_nm,
            sharedAddrsInd: shared_addrs_ind,
            trsuryAddrsFiveTxt: trsury_addrs_five_txt,
            trsuryAddrsFourTxt: trsury_addrs_four_txt,
            trsuryAddrsOneTxt: trsury_addrs_one_txt,
            trsuryAddrsSixTxt: trsury_addrs_six_txt,
            trsuryAddrsThreeTxt: trsury_addrs_three_txt,
            trsuryAddrsTwoTxt: trsury_addrs_two_txt,
            trsurySeqNbr: trsury_seq_nbr,
            trtryNm: trtry_nm,
            zipFirstSuffixNbr: zip_first_suffix_nbr,
            zipPrefixNbr: zip_prefix_nbr,
            zipSecondSuffixNbr: zip_second_suffix_nbr
          }
        },
        ssn
      )
binding.pry
      response.body['vnp_ptcpnt_addrs_create_response']['return']
    end
  end
end
