import 'package:arm_project/utils/constants.dart';
import 'package:arm_project/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../resources/app_strings.dart';

class CustomChart extends StatelessWidget {
  const CustomChart(
      {required this.weekValuesMap,
      required this.color,
      required this.selectedColor,
      required this.title,
      super.key});

  final Color color;
  final Color selectedColor;
  final String title;
  final Map<String, double> weekValuesMap;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        title: ChartTitle(text: title),
        primaryXAxis:
            CategoryAxis(labelStyle: Theme.of(context).textTheme.labelSmall),
        series: <ChartSeries>[
          ColumnSeries<ChartData, String>(
              dataSource: _chartDataWeekDays(weekValuesMap),
              color: color,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              pointColorMapper: (_, index) =>
                  index == getWeekDayIndex(DateTime.now()) - 1
                      ? selectedColor
                      : color,
              dataLabelSettings: DataLabelSettings(
                isVisible: true,
                textStyle: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(color: selectedColor),
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              width: 0.5),
        ]);
  }

  //todo: make this fucntion more flexible
  List<ChartData> _chartDataWeekDays(Map<String, double> weekValues) {
    List<ChartData> chartData = [];
    for (int i = 6; i >= 0; i--) {
      chartData.add(ChartData(
          weekDaysShort[
              getWeekDayIndex(DateTime.now().subtract(Duration(days: i))) - 1],
          weekValues[weekDaysShort[
              getWeekDayIndex(DateTime.now().subtract(Duration(days: i))) -
                  1]]));
    }
    return chartData;
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double? y;
}
