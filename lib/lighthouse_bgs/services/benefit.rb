# frozen_string_literal: true

# As a work of the United States Government, this project is in the
# public domain within the United States.
#
# Additionally, we waive copyright and related rights in the work
# worldwide through the CC0 1.0 Universal public domain dedication.

module LighthouseBGS
  class BenefitClaimWebService < LighthouseBGS::Base
    def bean_name
      'BenefitClaimServiceBean'
    end

    def self.service_name
      'claims'
    end

    def find_by_vbms_file_number(file_number)
      response = request(:find_benefit_claim, 'fileNumber': file_number)

      response.body[:find_benefit_claim_response][:return][:participant_record][:selection] ||
        Array.wrap(response.body[:find_benefit_claim_response][:return][:participant_record]) || []
    end

    def find_claim_detail_by_id(id)
      response = request(:find_benefit_claim_detail, 'benefitClaimId': id)

      response.body[:find_benefit_claim_detail_response][:return] || []
    end

    # We have no idea what reason 1 is, these are only being used in UAT for testing purposes
    def clear_end_product(file_number:, end_product_code:, modifier:, reason: '1')
      response = request(:clear_benefit_claim, 'clearBenefitClaimInput': {
                           'fileNumber': file_number,
                           'payeeCode': '00',
                           'benefitClaimType': '1',
                           'endProductCode': end_product_code,
                           'incremental': modifier,
                           'pclrReasonCode': reason
                         })

      response.body || []
    end

    def cancel_end_product(file_number:, end_product_code:, modifier:, reason: '1')
      response = request(:cancel_benefit_claim, 'cancelBenefitClaimInput': {
                           'fileNumber': file_number,
                           'payeeCode': '00',
                           'benefitClaimType': '1',
                           'endProductCode': end_product_code,
                           'incremental': modifier,
                           'pcanReasonCode': reason
                         })

      response.body || []
    end

    # either date_of_claim OR suspense_date must be populated mm/dd/yyyy
    def insert_benefit_claim(options)      
      validate_required_keys(required_insert_benefit_claim_fields, options, __method__.to_s)

      response = request(
        :insert_benefit_claim,
        {
          "benefitClaimInput": {
            "fileNumber": options[:file_number],
            "ssn": options[:ssn],
            "benefitClaimType": options[:benefit_claim_type],
            "payee": options[:payee],
            "endProduct": options[:end_product],
            "endProductCode": options[:end_product_code],
            "firstName": options[:first_name],
            "lastName": options[:last_name],
            "city": options[:city],
            "state": options[:state],
            "postalCode": options[:postal_code],
            "country": options[:country],
            "disposition": options[:disposition],
            "sectionUnitNo": options[:section_unit_no],
            "folderWithClaim": options[:folder_with_claim],
            "endProductName": options[:end_product_name],
            "preDischargeIndicator": options[:pre_discharge_indicator],
            "dateOfClaim": options[:date_of_claim],
            "titleName": options[:title_name],
            "middleName": options[:middle_name],
            "suffixName": options[:suffix_name],
            "addressLine1": options[:address_line1],
            "addressLine2": options[:address_line2],
            "addressLine3": options[:address_line3],
            "postalCodePlus4": options[:postal_code_plus4],
            "dayTimeAreaCode": options[:day_time_area_code],
            "dayTimePhoneNumber": options[:day_time_phone_number],
            "nightTimeAreaCode": options[:night_time_area_code],
            "nightTimePhoneNumber": options[:night_time_phone_number],
            "emailAddress": options[:email_address],
            "suspenseDate": options[:suspense_date],
            "futureReason": options[:future_reason],
            "claimantSsn": options[:claimant_ssn],
            "beneficiaryDateOfBirth": options[:beneficiary_date_of_birth],
            "powerOfAttorney": options[:power_of_attorney],
            "gulfWarRegistryPermit": options[:guf_war_registry_permit],
            "suppressAcknowledgementLetter": options[:suppress_acknowledgement_letter],
            "specialIssueCase": options[:special_issue_case],
            "inTakeSite": options[:in_take_site],
            "soj": options[:soj],
            "mltyPostalTypeCd": options[:mlty_postal_type_cd],
            "mltyPostOfficeTypeCd": options[:mlty_post_office_type_cd],
            "foreignMailCode": options[:foreign_mail_code],
            "addressType": options[:address_type],
            "bypassIndicator": options[:bypass_indicator],
            "bnftClaimId": options[:bnft_claim_id],
            "allowPoaAccess": options[:allow_poa_access],
            "allowPoaCadd": options[:allow_poa_cadd],
            "submtrRoleTypeCd": options[:submtr_role_type_cd],
            "submtrApplcnTypeCd": options[:submtr_applcn_type_cd],
            "awardSoj": options[:award_soj],
            "powNumberOfDays": options[:pow_number_of_days],
            "homelessIndicator": options[:homeless_indicator],
            "ptcpntIdClaimant": options[:ptcpnt_id_claimant],
            "preDschrgTypeCd": options[:pre_dschrg_type_cd],
            "personOrgInd": options[:person_org_ind],
            "payeeOrgName": options[:payee_org_name],
            "payeeOrgType": options[:payee_org_type],
            "payeeOrgTitle": options[:payee_org_title],
            "groupOneValidatedInd": options[:group_one_validated_ind],
            "prvncNm": options[:prvnc_nm],
            "trtryNm": options[:trtry_nm],
            "treasuryMailingAddress1": options[:treasury_mailing_address1],
            "treasuryMailingAddress2": options[:treasury_mailing_address2],
            "treasuryMailingAddress3": options[:treasury_mailing_address3],
            "treasuryMailingAddress4": options[:treasury_mailing_address4],
            "treasuryMailingAddress5": options[:treasury_mailing_address5],
            "treasuryMailingAddress6": options[:treasury_mailing_address6],
            "fiduciaryOneLastName": options[:fiduciary_one_last_name],
            "fiduciaryOneFirstName": options[:fiduciary_one_first_name],
            "fiduciaryOneMiddleName": options[:fiduciary_one_middle_name],
            "fiduciaryOneSuffixName": options[:fiduciary_one_suffix_name],
            "fiduciaryOrgName": options[:fiduciary_org_name],
            "ptcpntIdFiduciaryOne": options[:ptcpnt_id_fiduciary_one],
            "fiduciaryOrgTitle": options[:fiduciary_org_title],
            "fiduciaryOrgType": options[:fiduciary_org_type],
            "fiduciaryPrepPhraseType": options[:fiduciary_prep_phrase_type]
          }
        },
        options[:ssn]
      )

      response.body[:insert_benefit_claim_response][:return]
    end

    private

    def required_insert_benefit_claim_fields
      %i[
        file_number
        ssn
        benefit_claim_type
        payee
        end_product
        end_product_code
        first_name
        last_name
        city
        state
        postal_code
        country
        disposition
        section_unit_no
        folder_with_claim
        end_product_name
        pre_discharge_indicator
      ]
    end
  end
end
