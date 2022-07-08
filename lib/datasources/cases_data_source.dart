import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:service_now_assistant/controllers/responsive_controller.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../models/case_list_model.dart';

class CasesDataSource extends DataGridSource {
  CasesDataSource({required List<CaseListRow> cases}) {
    dataGridRows = cases
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<Widget>(
                columnName: 'casenumber',
                value: Text(
                  dataGridRow.caseNumber,
                  style: const TextStyle(
                      color: Color(0xffD9DBE9), fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              DataGridCell<Widget>(
                columnName: 'timetofirstresponse',
                value: Text(
                  dataGridRow.timeToFirstResponse == null
                      ? ''
                      : dataGridRow.timeToFirstResponse!,
                  style: const TextStyle(
                    color: Color(0xffD9DBE9),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              DataGridCell<Widget>(
                columnName: 'targetResponseTime',
                value: Text(
                  dataGridRow.targetResponseTime == null
                      ? ''
                      : dataGridRow.targetResponseTime!,
                  style: const TextStyle(
                    color: Color(0xffD9DBE9),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              DataGridCell<String>(
                columnName: 'flag',
                value: dataGridRow.flag,
              ),
              DataGridCell<Widget>(
                columnName: 'lastModified',
                value: Text(
                  dataGridRow.lastModified,
                  style: const TextStyle(
                    color: Color(0xffD9DBE9),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              DataGridCell<Widget>(
                columnName: 'severity',
                value: Text(
                  dataGridRow.severity,
                  style: const TextStyle(
                    color: Color(0xffD9DBE9),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              DataGridCell<Widget>(
                columnName: 'status',
                value: Text(
                  dataGridRow.status,
                  style: const TextStyle(
                    color: Color(0xffD9DBE9),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              DataGridCell<Widget>(
                columnName: 'version',
                value: Text(
                  dataGridRow.version,
                  style: const TextStyle(
                    color: Color(0xffD9DBE9),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              DataGridCell<Widget>(
                columnName: 'supportType',
                value: Text(
                  dataGridRow.supportType,
                  style: const TextStyle(
                    color: Color(0xffD9DBE9),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ]))
        .toList();
  }

  List<DataGridRow> dataGridRows = [];

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    final ResponsiveController controller = Get.find();
    int index = effectiveRows.indexOf(row);

    Color getRowBackgroundColor() {
      if (index.isEven) {
        return const Color(0xff14142B);
      }
      return const Color(0xff262338);
    }

    return DataGridRowAdapter(

        //color: getRowBackgroundColor(),
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            borderRadius: dataGridCell.columnName == 'casenumber' && index == 0
                ? const BorderRadius.only(
                    topLeft: Radius.circular(8),
                  )
                : dataGridCell.columnName == 'casenumber' &&
                        index == dataGridRows.length - 1
                    ? const BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                      )
                    : dataGridCell.columnName == 'supportType' && index == 0
                        ? const BorderRadius.only(
                            topRight: Radius.circular(8),
                          )
                        : dataGridCell.columnName == 'supportType' &&
                                index == dataGridRows.length - 1
                            ? const BorderRadius.only(
                                bottomRight: Radius.circular(8),
                              )
                            : BorderRadius.circular(0),
            color: controller.dataGridController.selectedRow == row
                ? const Color(0xff4543A3)
                : getRowBackgroundColor()),
        child: dataGridCell.value.runtimeType == String &&
                dataGridCell.columnName == 'flag' &&
                dataGridCell.value != null
            ? Icon(
                CupertinoIcons.flag,
                color: (() {
                  switch (dataGridCell.value) {
                    case 'redflag':
                      return Colors.red;
                    case 'orangeflag':
                      return Colors.orange;
                    default:
                  }
                }()),
              )
            : dataGridCell.value,
      );
    }).toList());
  }

  @override
  int compare(DataGridRow? a, DataGridRow? b, SortColumnDetails sortColumn) {
    Object? _getCellValue(List<DataGridCell>? cells, String columnName) {
      return columnName == 'flag'
          ? cells
              ?.firstWhereOrNull(
                  (DataGridCell element) => element.columnName == columnName)
              ?.value
          : cells
              ?.firstWhereOrNull(
                  (DataGridCell element) => element.columnName == columnName)
              ?.value
              .data;
    }

    final Object? valueA = _getCellValue(a?.getCells(), sortColumn.name);
    final Object? valueB = _getCellValue(b?.getCells(), sortColumn.name);
    return _compareTo(valueA, valueB, sortColumn.sortDirection);
  }

  int _compareTo(
      dynamic value1, dynamic value2, DataGridSortDirection sortDirection) {
    if (sortDirection == DataGridSortDirection.ascending) {
      if (value1 == null) {
        return -1;
      } else if (value2 == null) {
        return 1;
      }
      return value1.compareTo(value2) as int;
    } else {
      if (value1 == null) {
        return 1;
      } else if (value2 == null) {
        return -1;
      }
      return value2.compareTo(value1) as int;
    }
  }
}
