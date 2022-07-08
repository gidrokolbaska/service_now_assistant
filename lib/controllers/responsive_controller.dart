import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_now_assistant/models/case_list_model.dart';
import 'package:service_now_assistant/widgets/allcasesviewwidget.dart';
import 'package:service_now_assistant/widgets/mycasesviewwidget.dart';
import 'package:service_now_assistant/widgets/searchviewwidget.dart';
import 'package:service_now_assistant/widgets/settingsviewwidget.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../datasources/cases_data_source.dart';

class ResponsiveController extends GetxController {
  var selectedIndexForMainMenuIcons = 0.obs;
  var watchThisQueue = false.obs;
  final selectedQueue = Rxn<String>();
  var testQueueList = [
    'EMEA: Backup Tier 1',
    'EMEA: Backup Tier 2',
    'EMEA: Backup Tier 3',
    'EMEA: Backup Tier 4',
    'EMEA: Backup Tier 5',
    'EMEA: Backup Tier 6',
    'EMEA: Backup Tier 7',
    'EMEA: Backup Tier 8',
    'EMEA: Backup Tier 9',
    'EMEA: Backup Tier 10',
    'EMEA: Backup Tier 11',
    'EMEA: Backup Tier 12',
    'EMEA: Backup Tier 13',
    'EMEA: Backup Tier 14',
    'EMEA: Backup Tier 15',
    'EMEA: Backup Tier 16',
    'EMEA: Backup Tier 17',
    'EMEA: Backup Tier 18',
    'EMEA: Backup Tier 19',
  ].obs;
  var caseList = [
    CaseListRow(
        caseNumber: '05258870',
        timeToFirstResponse: 'timeToFirstResponse0',
        flag: 'redflag',
        accountName: "The best client in the world",
        accountValue: "\$1488",
        additionalContactData: '',
        additionalDetails: '',
        caseOwner: 'EMEA: Backup Tier 1',
        contactEmail: 'bestclient@alwaysthebest.com',
        contactName: 'Best Client',
        contactPhone: '+228 1488 1337',
        customerDefinedContractID: '',
        dateTimeOpened:
            DateTime.now().subtract(const Duration(days: 3)).toString(),
        entitlement: 'Super Mega Enterprise',
        followTheSun: true,
        hotFixProvided: false,
        lastModified: DateTime.now().toString(),
        localTime: '',
        location: 'Saint-Petersburg',
        preferredLanguage: 'English',
        product: 'Veeam Backup & Replication',
        professionalServices: false,
        region: 'Europe',
        severity: '1',
        status: 'Open',
        subject: 'My backups are working, created the case just for lolz',
        supportType: 'Omega-Production Support',
        version: 'vNext'),
    CaseListRow(
        accountValue: "\$1488",
        caseNumber: '05258871',
        timeToFirstResponse: 'timeToFirstResponse1',
        accountName: '',
        additionalContactData: '',
        additionalDetails: '',
        caseOwner: '',
        contactEmail: '',
        contactName: '',
        contactPhone: '',
        customerDefinedContractID: '',
        dateTimeOpened: '',
        entitlement: '',
        followTheSun: false,
        hotFixProvided: false,
        lastModified: '',
        localTime: '',
        location: '',
        preferredLanguage: '',
        product: '',
        professionalServices: false,
        region: '',
        severity: '',
        status: '',
        subject: '',
        supportType: '',
        version: ''),
    CaseListRow(
        accountValue: "\$1488",
        caseNumber: '05258872',
        timeToFirstResponse: 'timeToFirstResponse2',
        accountName: '',
        additionalContactData: '',
        additionalDetails: '',
        caseOwner: '',
        contactEmail: '',
        contactName: '',
        contactPhone: '',
        customerDefinedContractID: '',
        dateTimeOpened: '',
        entitlement: '',
        followTheSun: false,
        hotFixProvided: false,
        lastModified: '',
        localTime: '',
        location: '',
        preferredLanguage: '',
        product: '',
        professionalServices: false,
        region: '',
        severity: '',
        status: '',
        subject: '',
        supportType: '',
        version: ''),
    CaseListRow(
        accountValue: "\$1488",
        caseNumber: '05258873',
        timeToFirstResponse: 'timeToFirstResponse3',
        flag: 'orangeflag',
        accountName: '',
        additionalContactData: '',
        additionalDetails: '',
        caseOwner: '',
        contactEmail: '',
        contactName: '',
        contactPhone: '',
        customerDefinedContractID: '',
        dateTimeOpened: '',
        entitlement: '',
        followTheSun: false,
        hotFixProvided: false,
        lastModified: '',
        localTime: '',
        location: '',
        preferredLanguage: '',
        product: '',
        professionalServices: false,
        region: '',
        severity: '',
        status: '',
        subject: '',
        supportType: '',
        version: ''),
    CaseListRow(
        accountValue: "\$1488",
        caseNumber: '05258874',
        timeToFirstResponse: 'timeToFirstResponse4',
        accountName: '',
        additionalContactData: '',
        additionalDetails: '',
        caseOwner: '',
        contactEmail: '',
        contactName: '',
        contactPhone: '',
        customerDefinedContractID: '',
        dateTimeOpened: '',
        entitlement: '',
        followTheSun: false,
        hotFixProvided: false,
        lastModified: '',
        localTime: '',
        location: '',
        preferredLanguage: '',
        product: '',
        professionalServices: false,
        region: '',
        severity: '',
        status: '',
        subject: '',
        supportType: '',
        version: ''),
    CaseListRow(
        accountValue: "\$1488",
        caseNumber: '05258875',
        timeToFirstResponse: 'timeToFirstResponse5',
        accountName: '',
        additionalContactData: '',
        additionalDetails: '',
        caseOwner: '',
        contactEmail: '',
        contactName: '',
        contactPhone: '',
        customerDefinedContractID: '',
        dateTimeOpened: '',
        entitlement: '',
        followTheSun: false,
        hotFixProvided: false,
        lastModified: '',
        localTime: '',
        location: '',
        preferredLanguage: '',
        product: '',
        professionalServices: false,
        region: '',
        severity: '',
        status: '',
        subject: '',
        supportType: '',
        version: ''),
    CaseListRow(
        accountValue: "\$1488",
        caseNumber: '05258876',
        timeToFirstResponse: 'timeToFirstResponse6',
        accountName: '',
        additionalContactData: '',
        additionalDetails: '',
        caseOwner: '',
        contactEmail: '',
        contactName: '',
        contactPhone: '',
        customerDefinedContractID: '',
        dateTimeOpened: '',
        entitlement: '',
        followTheSun: false,
        hotFixProvided: false,
        lastModified: '',
        localTime: '',
        location: '',
        preferredLanguage: '',
        product: '',
        professionalServices: false,
        region: '',
        severity: '',
        status: '',
        subject: '',
        supportType: '',
        version: ''),
  ].obs;
  var selectedCase = Rxn<CaseListRow>();
  late CasesDataSource employeeDataSource;
  late Map<String, double> columnWidths = {
    'casenumber': double.nan,
    'timetofirstresponse': double.nan,
    'targetResponseTime': double.nan,
    'flag': double.nan,
    'lastModified': double.nan,
    'severity': double.nan,
    'status': double.nan,
    'version': double.nan,
    'supportType': double.nan,
  }.obs;
  final DataGridController dataGridController = DataGridController();
  @override
  void onInit() {
    super.onInit();
    employeeDataSource = CasesDataSource(cases: caseList);
    pageList = RxList([
      AllCasesViewWidget(
        controller: this,
      ),
      Container(
        color: Colors.red,
      ),
      Container(
        key: UniqueKey(),
        color: Colors.blue,
      ),
      SizedBox(
        child: Container(
          color: Colors.green,
        ),
      ),
    ]);
  }

  var selectedPageIndex = 0.obs;
  late RxList pageList;
}