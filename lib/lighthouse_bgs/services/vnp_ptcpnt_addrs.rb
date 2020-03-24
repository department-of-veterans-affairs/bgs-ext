module LighthouseBGS
  class VnpPtcpntAddrsService < LighthouseBGS::Base
    def bean_name
      'VnpPtcpntAddrsWebServiceBean'
    end

    def self.service_name
      'vnp_ptcpnt_addrs'
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

      response.body['vnp_ptcpnt_addrs_create_response']['return']
    end
  end
end
