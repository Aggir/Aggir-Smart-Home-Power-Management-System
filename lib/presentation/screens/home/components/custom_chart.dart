import 'package:arm_project/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../resources/app_strings.dart';

class CustomChart extends StatelessWidget {
  const CustomChart(
      {required this.weekValues,
      required this.color,
      required this.selectedColor,
      super.key});

  final Color color;
  final Color selectedColor;
  final List<double?> weekValues;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        title: ChartTitle(text: AppStrings.thisWeek),
        primaryXAxis:
            CategoryAxis(labelStyle: Theme.of(context).textTheme.labelSmall),
        series: <ChartSeries>[
          ColumnSeries<ChartData, String>(
              dataSource: _chartDataWeekDays(weekValues),
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
  List<ChartData> _chartDataWeekDays(List<double?> weekValues) {
    final List<String> weekDaysShort = [
      AppStrings.saturdayShort,
      AppStrings.sundayShort,
      AppStrings.mondayShort,
      AppStrings.tuesdayShort,
      AppStrings.wednesdayShort,
      AppStrings.thursdayShort,
      AppStrings.fridayShort,
    ];
    int index = 0;
    List<ChartData> chartData = [];
    for (String weekDayShort in weekDaysShort) {
      chartData.add(ChartData(weekDayShort,
          weekValues.length - 1 < index ? null : weekValues[index]));
      index++;
    }
    return chartData;
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double? y;
}
