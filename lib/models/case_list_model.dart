class CaseListRow {
  CaseListRow(
      {required this.caseNumber,
      this.timeToFirstResponse,
      this.targetResponseTime,
      this.flag,
      required this.accountValue,
      required this.lastModified,
      required this.severity,
      required this.status,
      required this.version,
      required this.supportType,
      required this.caseOwner,
      required this.accountName,
      required this.entitlement,
      required this.contactName,
      required this.contactEmail,
      required this.contactPhone,
      this.ccEmail,
      required this.additionalContactData,
      required this.customerDefinedContractID,
      required this.preferredLanguage,
      required this.region,
      required this.location,
      required this.localTime,
      required this.product,
      required this.dateTimeOpened,
      required this.hotFixProvided,
      required this.professionalServices,
      this.logLocationsInternal,
      required this.followTheSun,
      required this.subject,
      required this.additionalDetails});
  final String caseNumber;
  final String? timeToFirstResponse;
  final String? targetResponseTime;
  final String? flag;
  final String lastModified;
  final String severity;
  final String status;
  final String version;
  final String supportType;
  final String caseOwner;
  final String accountName;
  final String accountValue;
  final String entitlement;
  final String contactName;
  final String contactEmail;
  final String contactPhone;
  final String? ccEmail;
  final String additionalContactData;
  final String customerDefinedContractID;
  final String preferredLanguage;
  final String region;
  final String location;
  final String localTime;
  final String product;
  final String dateTimeOpened;
  final bool hotFixProvided;
  final bool professionalServices;
  final String? logLocationsInternal;
  final bool followTheSun;
  final String subject;
  final String additionalDetails;
}
