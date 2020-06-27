# frozen_string_literal: true

# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.

module LighthouseBGS
  class VnpPtcpntAddrsService < LighthouseBGS::Base
    def bean_name
      'VnpPtcpntAddrsWebServiceBean'
    end

    def self.service_name
      'vnp_ptcpnt_addrs'
    end

    def vnp_ptcpnt_addrs_create(options)
      validate_required_keys(vnp_ptcpnt_addrs_create_required_fields, options, __method__.to_s)

      response = request(
        :vnp_ptcpnt_addrs_create,
        {
          "arg0": {
            efctvDt: options[:efctv_dt],
            vnpPtcpntId: options[:vnp_ptcpnt_id],
            vnpProcId: options[:vnp_proc_id],
            addrsOneTxt: options[:addrs_one_txt],
            addrsThreeTxt: options[:addrs_three_txt],
            addrsTwoTxt: options[:addrs_two_txt],
            badAddrsInd: options[:bad_addrs_ind],
            cityNm: options[:city_nm],
            cntryNm: options[:cntry_nm],
            countyNm: options[:county_nm],
            eftWaiverTypeNm: options[:eft_waiver_type_nm],
            emailAddrsTxt: options[:email_addrs_txt],
            endDt: options[:end_dt],
            fmsAddrsCodeTxt: options[:fms_addrs_code_txt],
            frgnPostalCd: options[:frgn_postal_cd],
            group1VerifdTypeCd: options[:group1_verifd_type_cd],
            jrnDt: options[:jrn_dt],
            jrnLctnId: options[:jrn_lctn_id],
            jrnObjId: options[:jrn_obj_id],
            jrnStatusTypeCd: options[:jrn_status_type_cd],
            jrnUserId: options[:jrn_user_id],
            lctnNm: options[:lctn_nm],
            mltyPostalTypeCd: options[:mlty_postal_type_cd],
            mltyPostOfficeTypeCd: options[:mlty_post_office_type_cd],
            postalCd: options[:postal_cd],
            prvncNm: options[:prvnc_nm],
            ptcpntAddrsTypeNm: options[:ptcpnt_addrs_type_nm],
            sharedAddrsInd: options[:shared_addrs_ind],
            trsuryAddrsFiveTxt: options[:trsury_addrs_five_txt],
            trsuryAddrsFourTxt: options[:trsury_addrs_four_txt],
            trsuryAddrsOneTxt: options[:trsury_addrs_one_txt],
            trsuryAddrsSixTxt: options[:trsury_addrs_six_txt],
            trsuryAddrsThreeTxt: options[:trsury_addrs_three_txt],
            trsuryAddrsTwoTxt: options[:trsury_addrs_two_txt],
            trsurySeqNbr: options[:trsury_seq_nbr],
            trtryNm: options[:trtry_nm],
            zipFirstSuffixNbr: options[:zip_first_suffix_nbr],
            zipPrefixNbr: options[:zip_prefix_nbr],
            zipSecondSuffixNbr: options[:zip_second_suffix_nbr]
          }
        },
        options[:ssn]
      )

      response.body[:vnp_ptcpnt_addrs_create_response][:return]
    end

    private

    def vnp_ptcpnt_addrs_create_required_fields
      %i[
        efctv_dt
        vnp_ptcpnt_id
        vnp_proc_id
        jrn_dt
        jrn_lctn_id
        jrn_obj_id
        jrn_status_type_cd
        jrn_user_id
        ptcpnt_addrs_type_nm
        shared_addrs_ind
      ]
    end
  end
end
