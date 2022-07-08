import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/responsive_controller.dart';
import '../main.dart';
import 'dropdown_list.dart';

class AllCasesViewWidget extends StatelessWidget {
  const AllCasesViewWidget({
    Key? key,
    this.scrollControllerVertical,
    required this.controller,
  }) : super(key: key);

  final ScrollController? scrollControllerVertical;
  final ResponsiveController controller;

  @override
  Widget build(BuildContext context) {
    return MultiSplitViewTheme(
      data: MultiSplitViewThemeData(
          dividerThickness: 3,
          dividerPainter: DividerPainters.grooved1(
              backgroundColor: const Color(0xffA996FF),
              color: Colors.white,
              highlightedColor: Colors.indigo[900]!)),
      child: MultiSplitView(initialWeights: const [
        0.8,
      ], children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  'Queues',
                  style: TextStyle(
                      height: 1,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 32.0,
                      letterSpacing: 1.0),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Obx(() => CustomDropdownButton2(
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 2,
                                  spreadRadius: 1,
                                  offset: Offset(3, 3)),
                            ],
                            color: const Color(0xff14132a),
                          ),
                          offset: const Offset(0, -20),
                          dropdownWidth: 300,
                          dropdownHeight: 300,
                          buttonElevation: 0,
                          buttonDecoration: BoxDecoration(
                              color: const Color(0xff262338),
                              borderRadius: BorderRadius.circular(20)),
                          buttonHeight: 30,
                          buttonWidth: 300.0,
                          iconEnabledColor: Colors.white,
                          icon: const Icon(CupertinoIcons.chevron_down),
                          hintColor: Colors.white,
                          hint: 'Select the queue',
                          value: controller.selectedQueue.value,
                          dropdownItems: controller.testQueueList,
                          scrollbarTrackAlwaysShow: true,
                          scrollbarAlwaysShow: true,
                          onChanged: (value) {
                            controller.selectedQueue.value = value;
                          },
                        )),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Icon(
                        CupertinoIcons.arrow_2_circlepath,
                        color: Colors.white,
                        size: 18.0,
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'VIEW CASE',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'LOCK CASE',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'TAKE SO',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'LOCK PRIORITY CASE',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'OPEN NEW CASE',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Row(
                      children: [
                        const Text('Watch this queue',
                            style: TextStyle(color: Colors.white)),
                        Obx(
                          () => Switch(
                            activeTrackColor: const Color(0xffA6F787),
                            inactiveTrackColor:
                                const Color(0xffA996FF).withOpacity(0.2),
                            thumbColor: MaterialStateProperty.all(
                                const Color(0xffA996FF)),
                            // trackColor:
                            //     MaterialStateProperty.all(
                            //         const Color(0xffA996FF)
                            //             .withOpacity(0.2)),
                            value: controller.watchThisQueue.value,
                            onChanged: (value) {
                              controller.watchThisQueue.value = value;
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              CaseTable(
                controller: controller,
              ),
            ],
          ),
        ),
        DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SegmentedTabControl(
                  // Customization of widget
                  radius: const Radius.circular(10),
                  backgroundColor: const Color(0xff262338),
                  indicatorColor: const Color(0xffA996FF),
                  tabTextColor: Colors.white70,
                  selectedTabTextColor: Colors.white,
                  squeezeIntensity: 2,
                  height: 25,
                  tabPadding: const EdgeInsets.symmetric(horizontal: 8),
                  textStyle: Theme.of(Get.context!).textTheme.bodyText1,
                  // Options for selection
                  // All specified values will override the [SegmentedTabControl] setting
                  tabs: const [
                    SegmentTab(
                      label: 'Details',
                      // For example, this overrides [indicatorColor] from [SegmentedTabControl]
                    ),
                    SegmentTab(
                      label: 'Comments',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Obx(
                        () => SingleChildScrollView(
                          controller: scrollControllerVertical,
                          scrollDirection: Axis.vertical,
                          child: controller.selectedCase.value == null
                              ? const SizedBox()
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        Table(
                                          columnWidths: const {
                                            0: FixedColumnWidth(250),
                                            1: FixedColumnWidth(700),
                                            //fixed to 100 width
                                          },
                                          children: [
                                            TableRow(children: [
                                              const TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: Text(
                                                  'Case Number:',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              TableCell(
                                                  verticalAlignment:
                                                      TableCellVerticalAlignment
                                                          .middle,
                                                  child: GestureDetector(
                                                    child: Text(
                                                        controller.selectedCase
                                                            .value!.caseNumber,
                                                        style: const TextStyle(
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                            color:
                                                                Colors.white)),
                                                    onTap: () async {
                                                      const url =
                                                          'https://www.youtube.com/watch?v=iik25wqIuFo';
                                                      if (await canLaunch(
                                                          url)) {
                                                        launch(url);
                                                      }
                                                    },
                                                  )),
                                            ]),
                                            TableRow(children: [
                                              const TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: Text(
                                                  'Case Owner:',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: Text(
                                                  controller.selectedCase.value!
                                                      .caseOwner,
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ]),
                                            TableRow(children: [
                                              const TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: Text(
                                                  'Account Name:',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: Text(
                                                  controller.selectedCase.value!
                                                      .accountName,
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ]),
                                            TableRow(children: [
                                              const TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: Text(
                                                  'Account Value:',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: Text(
                                                  controller.selectedCase.value!
                                                      .accountValue,
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ]),
                                            TableRow(children: [
                                              const TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: Text(
                                                  'Entitlement:',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: Text(
                                                  controller.selectedCase.value!
                                                      .entitlement,
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ]),
                                            TableRow(children: [
                                              const TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: Text(
                                                  'Contact Name:',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: Text(
                                                  controller.selectedCase.value!
                                                      .contactName,
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ]),
                                            TableRow(children: [
                                              const TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: Text(
                                                  'Contact Email:',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: Text(
                                                  controller.selectedCase.value!
                                                      .contactEmail,
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ]),
                                            TableRow(children: [
                                              const TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: Text(
                                                  'Contact Phone:',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: Text(
                                                  controller.selectedCase.value!
                                                      .contactPhone,
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ]),
                                            TableRow(children: [
                                              const TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: Text(
                                                  'Additional Contact Data:',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: const [
                                                    Text(
                                                      'turner richard',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    Text(
                                                      'richard.turner@lifeways.co.uk',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    Text(
                                                      '07718123510',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ]),
                                            TableRow(children: [
                                              const TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: Text(
                                                  'Customer Defined Contract ID:',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: Text(
                                                  controller.selectedCase.value!
                                                      .customerDefinedContractID,
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ]),
                                            TableRow(children: [
                                              const TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: Text(
                                                  'Preferred Language:',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: Text(
                                                  controller.selectedCase.value!
                                                      .preferredLanguage,
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ]),
                                            TableRow(children: [
                                              const TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: Text(
                                                  'Region:',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: Text(
                                                  controller.selectedCase.value!
                                                      .region,
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ]),
                                            TableRow(children: [
                                              const TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: Text(
                                                  'Location:',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: Text(
                                                  controller.selectedCase.value!
                                                      .location,
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ]),
                                            TableRow(children: [
                                              const TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: Text(
                                                  'Local Time:',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: Text(
                                                  controller.selectedCase.value!
                                                      .localTime,
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ]),
                                            TableRow(children: [
                                              const TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: Text(
                                                  'Support type:',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: Text(
                                                  controller.selectedCase.value!
                                                      .supportType,
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ]),
                                            TableRow(children: [
                                              const TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: Text(
                                                  'Severity:',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: Text(
                                                  controller.selectedCase.value!
                                                      .severity,
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ]),
                                            TableRow(children: [
                                              const TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: Text(
                                                  'Product:',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: Text(
                                                  controller.selectedCase.value!
                                                      .product,
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ]),
                                            TableRow(children: [
                                              const TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: Text(
                                                  'Version:',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: Text(
                                                  controller.selectedCase.value!
                                                      .version,
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ]),
                                            TableRow(children: [
                                              const TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: Text(
                                                  'Date/Time Opened:',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: Text(
                                                  controller.selectedCase.value!
                                                      .dateTimeOpened,
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ]),
                                            TableRow(children: [
                                              const TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: Text(
                                                  'Hotfix Provided:',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Checkbox(
                                                      fillColor:
                                                          MaterialStateProperty
                                                              .all(
                                                        const Color(0xffA996FF),
                                                      ),
                                                      value: controller
                                                          .selectedCase
                                                          .value!
                                                          .hotFixProvided,
                                                      onChanged: (value) {}),
                                                ),
                                              ),
                                            ]),
                                            TableRow(children: [
                                              const TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: Text(
                                                  'Professional Services:',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Checkbox(
                                                      fillColor:
                                                          MaterialStateProperty
                                                              .all(
                                                        const Color(0xffA996FF),
                                                      ),
                                                      value: controller
                                                          .selectedCase
                                                          .value!
                                                          .professionalServices,
                                                      onChanged: (value) {}),
                                                ),
                                              ),
                                            ]),
                                            TableRow(children: [
                                              const TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: Text(
                                                  'Log Locations Internal:',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: Text(
                                                  controller.selectedCase.value!
                                                          .logLocationsInternal ??
                                                      '',
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ]),
                                            TableRow(children: [
                                              const TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: Text(
                                                  'Follow The Sun:',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Checkbox(
                                                      fillColor:
                                                          MaterialStateProperty
                                                              .all(
                                                        const Color(0xffA996FF),
                                                      ),
                                                      value: controller
                                                          .selectedCase
                                                          .value!
                                                          .followTheSun,
                                                      onChanged: (value) {}),
                                                ),
                                              ),
                                            ]),
                                            TableRow(children: [
                                              const TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: Text(
                                                  'Status:',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: Text(
                                                  controller.selectedCase.value!
                                                      .status,
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ]),
                                            TableRow(children: [
                                              const TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: Text(
                                                  'Subject:',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              TableCell(
                                                verticalAlignment:
                                                    TableCellVerticalAlignment
                                                        .middle,
                                                child: Text(
                                                  controller.selectedCase.value!
                                                      .subject,
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ]),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: 3,
                                      color: const Color(0xffA996FF),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Additional Details:',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          controller.selectedCase.value!
                                              .additionalDetails,
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.blue,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
