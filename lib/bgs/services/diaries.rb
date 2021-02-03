# frozen_string_literal: true

module BGS
  # This service is used to store information about individuals the VA is
  # interested in. This information may be kept permanently, removed or discarded
  # if appropriate.
  class DiariesService < BGS::Base
    def bean_name
      'benefits-awards'
    end

    def namespace
      { namespaces: { 'xmlns:data' => 'http://gov.va.vba.benefits.awards.ws/data' } }
    end

    def self.service_name
      'diaries'
    end

    def read_diaries(options)
      response = request(
        :read_diaries,
        {
          'data:AwardKeyInput': {
            'awardType': options[:award_type],
            'beneficiaryID': options[:beneficiary_id],
            'veteranID': options[:participant_id]
          }
        },
        options[:ssn]
      )

      response.body[:read_diaries_response][:diary_response]
    end

    def update_diaries(options, diaries)
      response = request(
        :update_diaries, {
          'data:AwardKeyInput' => {
            'awardType' => options[:award_type],
            'beneficiaryID' => options[:beneficiary_id],
            'veteranID' => options[:participant_id]
          },
        'data:DiaryInput' => formatted_diary_list(diaries)
        }
      )

      response.body[:update_diaries_response][:diary_response]
    end

    def formatted_diary_list(diaries)
      diaries.map do |diary|
        diary_hash(diary)
      end
    end

    # rubocop:disable Metrics/MethodLength
    def diary_hash(diary)
      {
        'awardDiaryID' => diary[:award_diary_id],
        'awardType' => diary[:award_type],
        'beneficaryID' => diary[:beneficary_id],
        'diaryDueDate' => diary[:diary_due_date],
        'diaryLcStatusType' => diary[:diary_lc_status_type],
        'diaryLcStatusTypeDescription' => diary[:diary_lc_status_type_description],
        'diaryReasonType' => diary[:diary_reason_type],
        'diaryReasonTypeDescription' => diary[:diary_reason_type_description],
        'fileNumber' => diary[:file_number],
        'firstNm' => diary[:first_nm],
        'lastName' => diary[:last_name],
        'modifiedAction' => diary[:modified_action],
        'modifiedBy' => diary[:modified_by],
        'modifiedDate' => diary[:modified_date],
        'modifiedLocation' => diary[:modified_location],
        'modifiedProcess' => diary[:modified_process],
        'ptcpntDiaryID' => diary[:ptcpnt_diary_id],
        'statusDate' => diary[:status_date],
        'veteranID' => diary[:veteran_id]
      }
    end
    # rubocop:enable Metrics/MethodLength
  end
end
