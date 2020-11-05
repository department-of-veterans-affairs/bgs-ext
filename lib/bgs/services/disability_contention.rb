# frozen_string_literal: true

# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.

module BGS
  # This service gets information about a disability contention.
  class DisabilityContentionService < BGS::Base
    def bean_name
      'VDC'
    end

    def self.service_name
      'disability_contention'
    end

    def namespace
      { namespaces: { 'xmlns:ns0' => 'http://gov.va.vba.benefits.vdc/data' } }
    end

    # readAllContentions
    #   This service is used to find all the contentions information.
    def read_all_contentions(participant_id)
      response = request(
        :read_all_contentions,
        {
          'ns0:PtcpntId': {
            'vnpPtcpntId': participant_id
          }
        },
        participant_id
      )
      response.body[:read_all_contentions_response]
    end

    # addContention
    #   This service is used to add contention data.
    def add_contention(options)
      validate_required_keys(required_add_contention_fields, options, __method__.to_s)

      contention = {
        'cntntnTypeCd': options[:cntntn_type_cd],
        'vnpProcId': options[:vnp_proc_id],
        'vnpPtcpntId': options[:vnp_ptcpnt_id]
      }
      contention['beginDt'] = options[:begin_dt] unless options[:begin_dt].nil?
      contention['clmantTxt'] = options[:clmant_txt] unless options[:clmant_txt].nil?
      contention['cntntnClsfcnId'] = options[:cntntn_clsfcn_id] unless options[:cntntn_clsfcn_id].nil?
      contention['relatdDsbltyDt'] = options[:relatd_dsblty_dt] unless options[:relatd_dsblty_dt].nil?
      contention['relatdDsbltyId'] = options[:relatd_dsblty_id] unless options[:relatd_dsblty_id].nil?
      contention['relatdVnpCntntnId'] = options[:relatd_vnp_cntntn_id] unless options[:relatd_vnp_cntntn_id].nil?
      contention['speclCrcmstTypeCd'] = options[:specl_crcmst_type_cd] unless options[:specl_crcmst_type_cd].nil?
      contention['speclIssueTypeCd'] = options[:specl_issue_type_cd] unless options[:specl_issue_type_cd].nil?
      contention['vnpBnftClaimId'] = options[:vnp_bnft_claim_id] unless options[:vnp_bnft_claim_id].nil?

      response = request(
        :add_contention,
        { 'ns0:Contention': contention },
        options[:vnp_ptcpnt_id]
      )
      response.body[:add_contention_response][:contention_return]
    end

    # updateContention
    #   This service is used to update the contentions.
    def update_contention(options)
      validate_required_keys(required_update_contention_fields, options, __method__.to_s)

      contention = {
        'cntntnTypeCd': options[:cntntn_type_cd],
        'vnpCntntnId': options[:vnp_cntntn_id],
        'vnpPtcpntId': options[:vnp_ptcpnt_id]
      }
      contention['jrnDt'] = options[:jrn_dt] unless options[:jrn_dt].nil?
      contention['beginDt'] = options[:begin_dt] unless options[:begin_dt].nil?
      contention['clmantTxt'] = options[:clmant_txt] unless options[:clmant_txt].nil?
      contention['cntntnClsfcnId'] = options[:cntntn_clsfcn_id] unless options[:cntntn_clsfcn_id].nil?
      contention['relatdDsbltyDt'] = options[:relatd_dsblty_dt] unless options[:relatd_dsblty_dt].nil?
      contention['relatdDsbltyId'] = options[:relatd_dsblty_id] unless options[:relatd_dsblty_id].nil?
      contention['relatdVnpCntntnId'] = options[:relatd_vnp_cntntn_id] unless options[:relatd_vnp_cntntn_id].nil?
      contention['speclCrcmstTypeCd'] = options[:specl_crcmst_type_cd] unless options[:specl_crcmst_type_cd].nil?
      contention['speclIssueTypeCd'] = options[:specl_issue_type_cd] unless options[:specl_issue_type_cd].nil?
      contention['vnpBnftClaimId'] = options[:vnp_bnft_claim_id] unless options[:vnp_bnft_claim_id].nil?

      response = request(
        :update_contention,
        { 'ns0:ContentionUpdate': contention },
        options[:vnp_ptcpnt_id]
      )
      response.body[:update_contention_response][:contention_return]
    end

    # updateAllContention
    #   This service is used to update all the contentions.
    def update_all_contention(options)
      validate_required_keys(required_update_all_contention_fields, options, __method__.to_s)

      contention = {
        'cntntnTypeCd': options[:cntntn_type_cd],
        'vnpCntntnId': options[:vnp_cntntn_id],
        'vnpPtcpntId': options[:vnp_ptcpnt_id]
      }
      contention['jrnDt'] = options[:jrn_dt] unless options[:jrn_dt].nil?
      contention['beginDt'] = options[:begin_dt] unless options[:begin_dt].nil?
      contention['clmantTxt'] = options[:clmant_txt] unless options[:clmant_txt].nil?
      contention['cntntnClsfcnId'] = options[:cntntn_clsfcn_id] unless options[:cntntn_clsfcn_id].nil?
      contention['relatdDsbltyDt'] = options[:relatd_dsblty_dt] unless options[:relatd_dsblty_dt].nil?
      contention['relatdDsbltyId'] = options[:relatd_dsblty_id] unless options[:relatd_dsblty_id].nil?
      contention['relatdVnpCntntnId'] = options[:relatd_vnp_cntntn_id] unless options[:relatd_vnp_cntntn_id].nil?
      contention['speclCrcmstTypeCd'] = options[:specl_crcmst_type_cd] unless options[:specl_crcmst_type_cd].nil?
      contention['speclIssueTypeCd'] = options[:specl_issue_type_cd] unless options[:specl_issue_type_cd].nil?
      contention['vnpBnftClaimId'] = options[:vnp_bnft_claim_id] unless options[:vnp_bnft_claim_id].nil?

      response = request(
        :update_all_contention,
        { 'ns0:ContentionUpdate': contention },
        options[:vnp_ptcpnt_id]
      )
      response.body[:update_all_contention_response][:contention_return]
    end

    # deleteAllContentions
    #   This service is used to delete all contentions
    def delete_all_contentions(vnp_proc_id)
      response = request(
        :delete_all_contentions,
        {
          'ns0:ProcId': {
            'vnpProcId': vnp_proc_id
          }
        },
        vnp_proc_id
      )
      response.body[:delete_all_contentions_response]
    end

    # readAllDisplayDisabilities
    #   This service is used to find all the display disabilities information.
    def read_all_display_disabilities(participant_id)
      response = request(
        :read_all_display_disabilities,
        {
          'ns0:PtcpntId': {
            'vnpPtcpntId': participant_id
          }
        },
        participant_id
      )
      response.body[:read_all_display_disabilities_response]
    end

    # addDisplayDisability
    #   This service is used to add the display disability.
    def add_display_disability
      # TODO
    end

    # deleteAllDisplayDisabilities
    #   This service is used to delete all display contention.
    def delete_all_display_disabilities
      # TODO
    end

    private

    def required_add_contention_fields
      %i[
        cntntn_type_cd
        vnp_proc_id
        vnp_ptcpnt_id
      ]
    end

    def required_update_contention_fields
      %i[
        cntntn_type_cd
        vnp_cntntn_id
        vnp_ptcpnt_id
      ]
    end

    def required_update_all_contention_fields
      %i[
        cntntn_type_cd
        vnp_cntntn_id
        vnp_ptcpnt_id
      ]
    end
  end
end
