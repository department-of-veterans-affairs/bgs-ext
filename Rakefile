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

    services = ['MVISyncService/MVISyncService',
                'PaiWebServiceBean/PaiWebService',
                'AddressWebServiceBean/AddressWebService',
                'bep/services/security/AuthorizationService',
                'AwardWebServiceBean/AwardWebService',
                'BenefitClaimWebServiceBean/BenefitClaimWebService',
                'BenefitClaimServiceBean/BenefitClaimWebService',
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
                'MVISyncService/MVISyncService',
                'MviWebServiceBean/MviWebService',
                'OrgWebServiceBean/OrgWebService',
                'PaiWebServiceBean/PaiWebService',
                'PersonWebServiceBean/PersonWebService',
                'PhoneWebServiceBean/PhoneWebService',
                'RatingServiceBean/RatingWebService',
                'RatingWebServiceBean/RatingWebService',
                'RbaWebServiceBean/RbaWebService',
                'RORoutingServiceWS/RORoutingService',
                'SecurityWebServiceBean/SecurityWebService',
                'ShareStandardDataServiceBean/ShareStandardDataWebService',
                'StandardDataWebServiceBean/StandardDataWebService',
                '/SsaInquiryServiceBean/SsaInquiryService',
                'UploadedDocumentWebServiceBean/UploadedDocumentWebService',
                'VeteranWebServiceBean/VeteranWebService',
                'VetRecordServiceBean/VetRecordWebService',
                'Vet360MailingAddressActionsBean/Vet360MailingAddressActions',
                'VhaWebServiceBean/SecurityWebService',
                'VreFormDataWebServiceBean/VreFormDataWebService',
                'ClaimAssociationService/ClaimAssociationService',
                'ClaimManagementService/ClaimManagementService',
                'ContentionService/ContentionService',
                'ContentionWebServiceBean/ContentionWebService',
                'CoreSearchWebServiceBean/CoreSearchWebService',
                'DocumentService/DocumentService',
                'RatingCombinatorService/RatingCombinatorService',
                'RatingManagementService/RatingManagementService',
                'RatingUpdateService/RatingUpdateService',
                'StandardDataService/StandardDataService',
                'SyncClaimService/SyncClaimService',
                'SyncIdService/SyncIdService',
                'SyncPersonService/SyncPersonService',
                'TrackedItemService/TrackedItemService',
                'VeteranInformationService/VeteranInformationService',
                'WorkLoadService/WorkQueueService1',
                'WorkAssignmentService/WorkQueueService2',
                'benefits-awards/AccruedDecnService',
                'VDC/AdaptiveEquipService',
                'benefits-awards/AddressService',
                'benefits-awards/AdjustmentDecnsService',
                'benefits-awards/AwardDocService',
                'benefits-awards/AwardsService',
                'benefits-awards/BasicEligibilityDecnService',
                'benefits-awards/BurialDecnService',
                'benefits-awards/Chapter18DecnService',
                'benefits-common/ClaimsService',
                'benefits-awards/ClothingAllowanceDecnService',
                'benefits-awards/DeathBenefitDecnsService',
                'DependencyDecisionEJB/DependencyDecisionEJBService',
                'benefits-awards/DependencyDecnService',
                'benefits-awards/DiariesService',
                'benefits-awards/FinancialDecnService',
                'benefits-awards/FraudDecnService',
                'benefits-awards/InstznDecnService',
                'benefits-awards/MilitaryPayDecnService',
                'benefits-awards/MOHDecnService',
                'benefits-common/ParticipantService',
                'benefits-awards/PayRateDecnService',
                'benefits-awards/SuspendResumeService',
                'vnetstddata/VetsnetStandardDataService',
                'AmendAwardDependencyEJB/AmendAwardDependencyEJBService',
                'AwardStateEJB/AwardStateEJBService',
                'DependentOnAwardEJB/DependentOnAwardEJBService',
                'vrm-ws/PaymentInformationService',
                'RatingComparisonEJB/RatingComparisonEJBService',
                'ReadMilitaryPayEJB/ReadMilitaryPayService',
                'RvnMltyPersonEJB/RvnMltyPersonEJBService',
                'RvnPersonEJB/RvnPersonEJBService',
                'SvnMltyDecEJB/SvnMltyDecEJBService',
                'SvnMltyTheatrEJB/SvnMltyTheatrEJBService',
                'SvnPowEJB/SvnPowEJBService',
                'SvnSvcPeriodEJB/SvnSvcPeriodEJBService',
                'SvnTypeEJB/SvnTypeEJBService',
                'SvnTypeEJB/SvnTypeEJBServiceV2',
                'WvnMltyDecEJB/WvnMltyDecEJBService',
                'WvnMltyTheatrEJB/WvnMltyTheatrEJBService',
                'WvnPowEJB/WvnPowEJBService',
                'WvnSvcPeriodEJB/WvnSvcPeriodEJBService',
                'XvnRdPrsnProfleEJB/XvnRdPrsnProfleEJBService',
                'VDC/CPPersonalInformationService',
                'VDC/DirectDepositService',
                'VDC/DisabilityContentionService',
                'VDC/MedicalTreatmentFacilityLookupService',
                'VDC/MedicalTreatmentService',
                'VDC/MilitaryPayService',
                'VDC/MilitaryServiceService',
                'VDC/NonFederalMedicalTreatmentService',
                'UserInformationWebServiceBean/UserInformationService',
                'VDC/UserInformationServiceV2',
                'VeteranInformationService/VeteranInformationService',
                'VDC/VeteranOtherInformationService',
                'VDC/VeteranRepresentativeService',
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
                'VnpTempDataRfrncWebServiceBean/VnpTempDataRfrncService']

    services.each do |service|
      system("wget --no-check-certificate https://localhost:4447/#{service}?WSDL -P docs")
      (1..3).each do |instance|
        system("wget --no-check-certificate https://localhost:4447/#{service}?xsd=#{instance} -P docs")
      end
    end
  end
end
