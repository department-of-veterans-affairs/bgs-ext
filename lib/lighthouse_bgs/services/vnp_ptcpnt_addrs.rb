module LighthouseBGS
  class VnpPtcpntAddrsService < LighthouseBGS::Base
    def bean_name
      'VnpPtcpntAddrsWebServiceBean'
    end

    def self.service_name
      'vnp_ptcpnt_addrs'
    end

    def vnp_ptcpnt_addrs_create(
      efctv_dt:,
      vnp_ptcpnt_id:,
      vnp_proc_id:,
      jrn_dt:,
      jrn_lctn_id:,
      jrn_obj_id:,
      jrn_status_type_cd:,
      jrn_user_id:,
      ptcpnt_addrs_type_nm:,
      shared_addrs_ind:,
      addrs_one_txt: nil,
      addrs_three_txt: nil,
      addrs_two_txt: nil,
      bad_addrs_ind: nil,
      city_nm: nil,
      cntry_nm: nil,
      county_nm: nil,
      eft_waiver_type_nm: nil,
      email_addrs_txt: nil,
      end_dt: nil,
      fms_addrs_code_txt: nil,
      frgn_postal_cd: nil,
      group1_verifd_type_cd: nil,
      lctn_nm: nil,
      mlty_postal_type_cd: nil,
      mlty_post_office_type_cd: nil,
      postal_cd: nil,
      prvnc_nm: nil,
      trsury_addrs_one_txt: nil,
      trsury_addrs_two_txt: nil,
      trsury_addrs_three_txt: nil,
      trsury_addrs_four_txt: nil,
      trsury_addrs_five_txt: nil,
      trsury_addrs_six_txt: nil,
      trsury_seq_nbr: nil,
      trtry_nm: nil,
      zip_prefix_nbr: nil,
      zip_first_suffix_nbr: nil,
      zip_second_suffix_nbr: nil,
      ssn: nil # Just here to make mocks work
    )

      response = request(
        :vnp_ptcpnt_addrs_create,
        {
          "arg0": {
            efctvDt: efctv_dt,
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

      response.body[:vnp_ptcpnt_addrs_create_response][:return]
    end
  end
end
