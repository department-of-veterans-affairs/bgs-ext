# frozen_string_literal: true

# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.

module BGS
  # This service gets information about a claimant.
  class ClaimantWebService < BGS::Base
    def bean_name
      'ClaimantServiceBean'
    end

    def self.service_name
      'claimant'
    end

    # findFlashes (shrinqf)
    #   finds the Flashes (Person Special Status) related to a file number
    def find_flashes(file_number)
      response = request(:find_flashes, 'fileNumber': file_number)
      response.body[:find_flashes_response][:return]
    end

    # findAssignedFlashes (shrinqm)
    #   finds only assigned flashes
    def find_assigned_flashes(file_number)
      response = request(:find_assigned_flashes, 'fileNumber': file_number)
      response.body[:find_assigned_flashes_response][:return]
    end

    # findVBMSFlash (shrinqm)
    #   finds only the VBMS flash
    def find_vbms_flash(file_number)
      response = request(:find_vbms_flash, 'fileNumber': file_number)
      response.body[:find_vbms_flash_response][:return]
    end

    # addFlash (shrinqm, shrinq1)
    #   adds the provided flash to the provided file number
    def add_flash(options)
      validate_required_keys(required_add_flash_fields, options, __method__.to_s)

      response = request(
        :add_flash,
        {
          'fileNumber': options[:file_number],
          'flash': {
            'assignedIndicator': options[:assigned_indicator],
            'flashName': options[:flash_name],
            'flashType': options[:flash_type]
          }
        },
        options[:file_number]
      )
      response.body[:add_flash_response]
    end

    # removeFlash (shrinqm)
    #   removes the provided flash from the provided file number
    def remove_flash(options)
      validate_required_keys(required_remove_flash_fields, options, __method__.to_s)

      response = request(
        :remove_flash,
        {
          "fileNumber": options[:file_number],
          "flash": {
            'assignedIndicator': options[:assigned_indicator],
            'flashName': options[:flash_name],
            'flashType': options[:flash_type]
          }
        },
        options[:file_number]
      )
      response.body[:remove_flash_response]
    end

    # updateFlashes (shrinqm)
    #   adds/removes multiple flashes in one transaction
    def update_flashes(options)
      validate_required_keys(required_update_flashes_fields, options, __method__.to_s)

      flashes = options[:flashes].map do |flash|
        { 'assignedIndicator': flash[:assigned_indicator].nil? ? nil : flash[:assigned_indicator].strip,
          'flashName': flash[:flash_name].nil? ? nil : flash[:flash_name].strip,
          'flashType': flash[:flash_type].nil? ? nil : flash[:flash_type].strip }
      end

      response = request(
        :update_flashes,
        {
          'flashUpdateInput': {
            'flashes': flashes,
            'numberOfFlashes': flashes.count.to_s,
            'ptcpntID': options[:ptcpnt_id]
          }
        },
        options[:ptcpnt_id]
      )
      response.body[:update_flashes_response]
    end

    # findPOAByPtcntId (shrinqf)
    #   finds the Power of Attorney related to a participant ID.
    def find_poa_by_participant_id(id)
      response = request(:find_poa_by_ptcpnt_id, 'ptcpntId': id)
      response.body[:find_poa_by_ptcpnt_id_response][:return]
    end

    # findGeneralInformationByPtcpntIds (shrinqm)
    #   finds the General Information for given ptcpntIds, flashes, diaries,
    #   and evrs. Used when a list exist, and you want information on a single
    #   claimant
    def find_general_information_by_participant_id(id)
      response = request(:find_general_information_by_ptcpnt_id, 'ptcpntId': id)
      response.body[:find_general_information_by_ptcpnt_id_response][:return]
    end

    def find_all_relationships(id)
      response = request(:find_all_relationships, 'ptcpntId': id)
      response.body[:find_all_relationships_response][:return][:dependents]
    end

    # findDependentsByPtcpntId (shrinq3)
    #   finds the dependents related to a participant ID
    def find_dependents_by_participant_id(id, ssn)
      response = request(:find_dependents_by_ptcpnt_id, { 'ptcpntId': id }, ssn)
      response.body[:find_dependents_by_ptcpnt_id_response][:return]
    end

    private

    def required_add_flash_fields
      %i[file_number]
    end

    def required_update_flashes_fields
      %i[ptcpnt_id flashes]
    end

    def required_remove_flash_fields
      %i[file_number]
    end
  end
end
