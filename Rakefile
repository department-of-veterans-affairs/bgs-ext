# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rubocop/rake_task'
require 'bundler/audit/task'
require 'rspec/core/rake_task'

task default: [:spec, :rubocop, 'bundle:audit']

RSpec::Core::RakeTask.new(:spec)

desc 'Run RuboCop on the src directory'
RuboCop::RakeTask.new(:rubocop) do |task|
  task.patterns = ['lib/**/*.rb']
  # only show the files with failures
  task.formatters = ['files']
  # Trigger failure for CI
  task.fail_on_error = true
end

desc 'Run bundle-audit'
Bundler::Audit::Task.new

namespace :doc do
  desc 'Generate Documentation'
  task :generate do
    system('rm -rf docs')
    system('mkdir docs')

    services = ['BenefitClaimWebServiceBean/BenefitClaimWebService',
                'BenefitClaimServiceBean/BenefitClaimWebService',
                'PaiWebServiceBean/PaiWebService',
                'AddressWebServiceBean/AddressWebService',
                'AwardWebServiceBean/AwardWebService',
                'BenefitClaimWebServiceBean/BenefitClaimWebService',
                'BenefitClaimWebServiceBean/BenefitClaimWebService',
                'BenefitClaimServiceBean/BenefitClaimWebService',
                'BenefitClaimServiceBean/BenefitClaimWebService',
                'CaseWebServiceBean/CaseWebService',
                'ClaimantServiceBean/ClaimantWebService',
                'CorporateUpdateServiceBean/CorporateUpdateWebService',
                'CoversServiceBean/CoversWebService',
                'DbqWebServiceBean/DbqWebService',
                'DdeftWebServiceBean/DdeftWebService',
                'EBenefitsAddressUpdateWebServiceBean/EBenefitsAddressUpdateWebService',
                'EBenefitsBnftClaimStatusWebServiceBean/EBenefitsBnftClaimStatusWebService',
                'EducationWebServiceBean/EducationWebService',
                'EmploymentWebServiceBean/EmploymentWebService',
                'FiduciaryWebServiceBean/FiduciaryWebService',
                'IntentToFileWebServiceBean/IntentToFileWebService',
                'MilitaryWebServiceBean/MilitaryWebService',
                'MviWebServiceBean/MviWebService',
                'OrgWebServiceBean/OrgWebService',
                'WSDLPaiWebServiceBean/PaiWebService',
                'PersonWebServiceBean/PersonWebService',
                'PhoneWebServiceBean/PhoneWebService',
                'RatingServiceBean/RatingWebService',
                'RatingWebServiceBean/RatingWebService',
                'RbaWebServiceBean/RbaWebService',
                'SecurityWebServiceBean/SecurityWebService',
                'ShareStandardDataServiceBean/ShareStandardDataWebService',
                'StandardDataWebServiceBean/StandardDataWebService',
                'UploadedDocumentWebServiceBean/UploadedDocumentWebService',
                'VeteranWebServiceBean/VeteranWebService',
                'VetRecordServiceBean/VetRecordWebService',
                'VhaWebServiceBean/SecurityWebService',
                'VreFormDataWebServiceBean/VreFormDataWebService',
                'ContentionWebServiceBean/ContentionWebService',
                'CoreSearchWebServiceBean/CoreSearchWebService',
                'UserInformationWebServiceBean/UserInformationService',
                'VnpAtchmsWebServiceBean/VnpAtchmsService',
                'VnpAtchmsWebServiceBeanV2/VnpAtchmsServiceV2',
                'VnpBnftClaimWebServiceBean/VnpBnftClaimService',
                'VnpChildSchoolWebServiceBean/VnpChildSchoolService',
                'VnpChildStudentWebServiceBean/VnpChildStudentService',
                'VnpClaimInformationWebServiceBean/VnpClaimInformationService',
                'VnpPersonWebServiceBean/VnpPersonService',
                'VnpProcFormWebServiceBean/VnpProcFormService',
                'VnpProcWebServiceBean/VnpProcService',
                'VnpProcWebServiceBeanV2/VnpProcServiceV2',
                'VnpProcTempDataWebServiceBean/VnpProcTempDataService',
                'VnpProcTempDataWebServiceBeanV2/VnpProcTempDataServiceV2',
                'VnpPtcpntAddrsWebServiceBean/VnpPtcpntAddrsService',
                'VnpPtcpntPhoneWebServiceBean/VnpPtcpntPhoneService',
                'VnpPtcpntRlnshpWebServiceBean/VnpPtcpntRlnshpService',
                'VnpPtcpntWebServiceBean/VnpPtcpntService',
                'VnpTempDataRfrncWebServiceBean/VnpTempDataRfrncService',
                'BenefitClaimServiceBean/BenefitClaimWebService',
                'BenefitClaimWebServiceBean/BenefitClaimWebService',
                'BenefitClaimWebServiceBean/BenefitClaimWebService',
                'BenefitClaimServiceBean/BenefitClaimWebService']

    services.each do |service|
      system("wget --no-check-certificate https://localhost:4447/#{service}?xsd=1 -P docs")
    end
  end
end
