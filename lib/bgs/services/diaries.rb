# frozen_string_literal: true
require 'pry'

module BGS
  # This service is used to store information about individuals the VA is
  # interested in. This information may be kept permanently, removed or discarded
  # if appropriate.
  class DiariesService < BGS::Base
    def bean_name
      'benefits-awards'
    end

    def namespace
      {
        env_namespace: :soapenv,
        namespace_identifier: :ser,
        namespaces: {
          'xmlns:ser' => 'http://gov.va.vba.benefits.awards.ws/services',
          'xmlns:data' => 'http://gov.va.vba.benefits.awards.ws/data'
        }
      }
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
        {
          'awardDiaryID' => diary[:award_diary_id],
          'awardType' => diary[:award_type],
          'beneficaryID' => diary[:beneficary_id],
          'diaryDueDate' => diary[:diary_due_date],
          'diaryLcStatusType' => diary[:diary_lc_status_type], # PEND
          'diaryLcStatusTypeDescription' => diary[:diary_lc_status_type_description], # Pending
          'diaryReasonType' => diary[:diary_reason_type], # 24
          'diaryReasonTypeDescription' => diary[:diary_reason_type_description], #Issue Dependency Verification Form
          'fileNumber' => diary[:file_number],
          'firstNm' => diary[:first_nm],
          'lastName' => diary[:last_name],
          'modifiedAction' => diary[:modified_action], # I
          'modifiedBy' => diary[:modified_by], # CAPSBRAN
          'modifiedDate' => diary[:modified_date],
          'modifiedLocation' => diary[:modified_location], # 317
          'modifiedProcess' => diary[:modified_process], # cp_diary_pkg.do_create
          'ptcpntDiaryID' => diary[:ptcpnt_diary_id],
          'statusDate' => diary[:status_date],
          'veteranID' => diary[:veteran_id]
        }
      end
    end
  end
end
