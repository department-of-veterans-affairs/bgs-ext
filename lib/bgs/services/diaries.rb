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
            'awardType': 'CPL',
            'beneficiaryID': options[:participant_id],
            'veteranID': options[:participant_id]
          }
        },
        options[:ssn]
      )

      response.body[:read_diaries_response][:diary_response]
    end

    def update_diaries(options)
      response = request(
        :update_diaries,
        {
          'data:AwardKeyInput': {
            'awardType': 'CPL',
            'beneficiaryID': options[:benficiary_id],
            'veteranID': options[:participant_id]
          },
          'data:DiaryInput': {
            'awardType': 'CPL',
            'beneficaryID': options[:benficiary_id],
            'diaryDueDate': options[:diary_due_date],
            'diaryLcStatusType': options[:diary_lc_status_type], # PEND
            'diaryLcStatusTypeDescription': options[:diary_lc_status_description], # Pending
            'diaryReasonType': options[:diary_reason_type], # 24
            'diaryReasonTypeDescription': options[:diary_reason_type_description], #Issue Dependency Verification Form
            'fileNumber': options[:file_number],
            'firstNm': options[:first_name],
            'lastName': options[:last_name],
            'modifiedAction': options[:modified_action], # I
            'modifiedBy': options[:modified_by], # CAPSBRAN
            'modifiedDate': options[:modified_date],
            'modifiedLocation': options[:modified_location], # 317
            'modifiedProcess': options[:modified_process], # cp_diary_pkg.do_create
            'ptcpntDiaryID': options[:participant_id],
            'statusDate': options[:status_date],
            'veteranID': options[:veteran_id]
          }
        }
      )

      response.body[:update_diaries_response][:diary_response]
    end
  end
end
