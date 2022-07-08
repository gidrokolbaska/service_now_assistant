//import 'package:desktop_window/desktop_window.dart';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:service_now_assistant/bindings/responsive_binding.dart';
import 'package:service_now_assistant/controllers/responsive_controller.dart';

import 'package:service_now_assistant/widgets/main_view.dart';

import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'widgets/main_menu_icon.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DesktopWindow.setWindowSize(const Size(2000, 800));

  await DesktopWindow.setMinWindowSize(const Size(400, 500));
  await DesktopWindow.setMaxWindowSize(Size.infinite);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/home',
      getPages: [
        GetPage(
            name: '/home',
            page: () => MyHomePage(),
            binding: ResponsiveBinding()),
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        dividerColor: const Color(0xff000000),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), // <-- Radius
            ),
            primary: const Color(0xffA996FF),
            onPrimary: const Color(0xff14132a),
          ),
        ),
        scrollbarTheme: ScrollbarThemeData(
          trackColor: MaterialStateProperty.all(
            const Color(0xff14132a),
          ),
          thumbColor: MaterialStateProperty.all(const Color(0xffD9DBE9)),
        ),
        scaffoldBackgroundColor: const Color(0xff000000),
        fontFamily: 'Poppins',
        appBarTheme:
            const AppBarTheme(color: Color(0xff14132a), elevation: 0.0),
      ),
      home: Scaffold(
        appBar: AppBar(
          leadingWidth: 118,
          leading: Image.asset('assets/images/snowlogo.png'),
          centerTitle: false,
          title: const Text(
            'Veeam ServiceNow Assistant',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                letterSpacing: 1.0),
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends GetResponsiveView<ResponsiveController> {
  final ScrollController scrollControllerVertical = ScrollController();
  final ScrollController scrollControllerHorizontal = ScrollController();

  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget? phone() => Row(
        children: [
          Container(
            height: double.infinity,
            width: 150.0,
            color: Colors.blue,
          )
        ],
      );
  @override
  Widget? tablet() => const Text('tablet');
  @override
  Widget? desktop() => Scaffold(
      appBar: AppBar(
        leadingWidth: 118,
        leading: Image.asset('assets/images/snowlogo.png'),
        centerTitle: false,
        title: const Text(
          'Veeam ServiceNow Assistant',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18.0, letterSpacing: 1.0),
        ),
      ),
      body: Row(children: [
        Container(
          width: 108,
          color: const Color(0xff14132a),
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: ListView.separated(
              padding: const EdgeInsets.only(left: 20, right: 20),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  child: Obx(() => AnimatedContainer(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: controller.selectedIndexForMainMenuIcons.value ==
                                index
                            ? const Color(0xffA996FF).withOpacity(0.2)
                            : null,
                      ),
                      duration: const Duration(milliseconds: 300),
                      child: MainMenuIcon(
                        color: controller.selectedIndexForMainMenuIcons.value ==
                                index
                            ? const Color(0xffA996FF)
                            : Colors.white,
                        index: index,
                      ))),
                  onTap: () {
                    controller.selectedIndexForMainMenuIcons.value = index;
                    controller.selectedPageIndex.value = index;
                  },
                );
              },
              itemCount: 4,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 20.0,
                );
              },
            ),
          ),
        ),
        Expanded(child: MainView()),
      ]));
}

class CaseTable extends StatefulWidget {
  const CaseTable({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ResponsiveController controller;

  @override
  State<CaseTable> createState() => _CaseTableState();
}

class _CaseTableState extends State<CaseTable> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SfDataGridTheme(
        data: SfDataGridThemeData(
          sortIconColor: const Color(0xffA996FF),
          columnResizeIndicatorColor: const Color(0xffA996FF),
          gridLineStrokeWidth: 3.0,
        ),
        child: SfDataGrid(
          onSelectionChanged: (addedRows, removedRows) {
            widget.controller.selectedCase.value = widget.controller
                .caseList[widget.controller.dataGridController.selectedIndex];
          },
          controller: widget.controller.dataGridController,
          allowColumnsResizing: true,
          onColumnResizeUpdate: (ColumnResizeUpdateDetails details) {
            setState(() {
              widget.controller.columnWidths[details.column.columnName] =
                  details.width;
            });

            return true;
          },
          headerRowHeight: 45,
          allowSorting: true,
          allowMultiColumnSorting: true,
          allowTriStateSorting: true,
          footer: const SizedBox(),
          footerHeight: 16.0,
          isScrollbarAlwaysShown: true,
          defaultColumnWidth: 150.0,
          selectionMode: SelectionMode.single,
          columnWidthMode: ColumnWidthMode.fill,
          columnWidthCalculationRange: ColumnWidthCalculationRange.allRows,
          source: widget.controller.employeeDataSource,
          columns: [
            GridColumn(
              width: widget.controller.columnWidths['casenumber']!,
              minimumWidth: 50,
              maximumWidth: 200,
              columnName: 'casenumber',
              label: Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'CASE NUMBER',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(color: Color(0xffA0A3BD)),
                ),
              ),
            ),
            GridColumn(
              width: widget.controller.columnWidths['timetofirstresponse']!,
              minimumWidth: 50,
              maximumWidth: 300,
              columnName: 'timetofirstresponse',
              label: Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'TIME TO FIRST RESPONSE',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    color: Color(0xffA0A3BD),
                  ),
                ),
              ),
            ),
            GridColumn(
              width: widget.controller.columnWidths['targetResponseTime']!,
              minimumWidth: 50,
              maximumWidth: 300,
              columnName: 'targetResponseTime',
              label: Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'TARGET RESPONSE TIME',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(color: Color(0xffA0A3BD)),
                ),
              ),
            ),
            GridColumn(
              width: widget.controller.columnWidths['flag']!,
              minimumWidth: 50,
              maximumWidth: 100,
              columnName: 'flag',
              label: Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'FLAG',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(color: Color(0xffA0A3BD)),
                ),
              ),
            ),
            GridColumn(
              width: widget.controller.columnWidths['lastModified']!,
              minimumWidth: 50,
              maximumWidth: 250,
              columnName: 'lastModified',
              label: Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'LAST MODIFIED',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(color: Color(0xffA0A3BD)),
                ),
              ),
            ),
            GridColumn(
              width: widget.controller.columnWidths['severity']!,
              minimumWidth: 50,
              maximumWidth: 100,
              columnName: 'severity',
              label: Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'SEVERITY',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(color: Color(0xffA0A3BD)),
                ),
              ),
            ),
            GridColumn(
              width: widget.controller.columnWidths['status']!,
              minimumWidth: 50,
              maximumWidth: 150,
              columnName: 'status',
              label: Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'STATUS',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(color: Color(0xffA0A3BD)),
                ),
              ),
            ),
            GridColumn(
              width: widget.controller.columnWidths['version']!,
              minimumWidth: 50,
              maximumWidth: 100,
              columnName: 'version',
              label: Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'VERSION',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(color: Color(0xffA0A3BD)),
                ),
              ),
            ),
            GridColumn(
              width: widget.controller.columnWidths['supportType']!,
              minimumWidth: 150,
              maximumWidth: 200,
              columnName: 'supportType',
              label: Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'SUPPORT TYPE',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(color: Color(0xffA0A3BD)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
