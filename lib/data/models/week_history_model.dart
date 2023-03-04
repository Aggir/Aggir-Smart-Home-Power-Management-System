// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class WeekHistoryModel extends Equatable {
  final int totalCutMinutes;
  final int totalPowerCuts;
  final Map<String, double> weekData;
  const WeekHistoryModel({
    required this.totalCutMinutes,
    required this.totalPowerCuts,
    required this.weekData,
  });

  @override
  List<Object?> get props => [totalCutMinutes,totalPowerCuts,weekData];
}
