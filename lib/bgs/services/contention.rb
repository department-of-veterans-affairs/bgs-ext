# frozen_string_literal: true

# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.

module BGS
  # This service manages information about a contention.
  class ContentionService < BGS::Base
    def bean_name
      'ContentionService'
    end

    def self.service_name
      'contention'
    end

    # manageContentions
    #  This service is used to get contentions for a participant.
    def find_contentions_by_ptcpnt_id(participant_id)
      response = request(:find_contentions_by_ptcpnt_id, ptcpntId: participant_id)
      response.body[:find_contentions_by_ptcpnt_id_response]
    end

    # manageContentions
    #  This service is used to manage contention data.
    #
    # NOTE: There are many additional attributes that can be submitted through this method.
    #       There are simply too many to reasonably manage in this first pass.
    def manage_contentions(options) # rubocop:disable Metrics/MethodLength
      validate_required_keys(required_manage_contentions_fields, options, __method__.to_s)

      contentions = options[:contentions].map do |contention|
        {
          clmId: contention[:clm_id],
          cntntnId: contention[:cntntn_id],
          specialIssues: contention[:special_issues].map do |special_issue|
            { spisTc: special_issue[:spis_tc] }
          end
        }
      end

      response = request(
        :manage_contentions,
        {
          BenefitClaim: {
            jrnDt: options[:jrn_dt],
            bnftClmTc: options[:bnft_clm_tc],
            bnftClmTn: options[:bnft_clm_tn],
            claimRcvdDt: options[:claim_rcvd_dt],
            clmId: options[:clm_id],
            contentions: contentions,
            lcSttRsnTc: options[:lc_stt_rsn_tc],
            lcSttRsnTn: options[:lc_stt_rsn_tn],
            lctnId: options[:lctn_id],
            nonMedClmDesc: options[:non_med_clm_desc],
            prirty: options[:prirty],
            ptcpntIdClmnt: options[:ptcpnt_id_clmnt],
            ptcpntIdVet: options[:ptcpnt_id_vet],
            ptcpntSuspnsId: options[:ptcpnt_suspns_id],
            sojLctnId: options[:soj_lctn_id]
          }
        },
        options[:ptcpnt_id_clmnt]
      )
      response.body[:manage_contentions_response]
    end

    private

    def required_manage_contentions_fields
      %i[
        jrn_dt
        bnft_clm_tc
        bnft_clm_tn
        claim_rcvd_dt
        clm_id
        lc_stt_rsn_tc
        lc_stt_rsn_tn
        lctn_id
        non_med_clm_desc
        prirty
        ptcpnt_id_clmnt
        ptcpnt_id_vet
        ptcpnt_suspns_id
        soj_lctn_id
      ]
    end
  end
end
