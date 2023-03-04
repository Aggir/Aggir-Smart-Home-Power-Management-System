import 'package:arm_project/data/dataproviders/firebase_dataprovider.dart';
import 'package:arm_project/data/models/device_model.dart';
import 'package:arm_project/data/models/electricity_model.dart';
import 'package:arm_project/data/models/generator_model.dart';
import 'package:arm_project/data/models/history_model.dart';
import 'package:arm_project/data/models/week_history_model.dart';
import 'package:arm_project/utils/constants.dart';
import 'package:arm_project/utils/functions.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:meta/meta.dart';

import '../../../presentation/resources/app_strings.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final FirebaseDataProvider _dataProvider = FirebaseDataProvider();

  void getData() async {
    emit(HomeLoading());
    try {
      DatabaseReference db = await _dataProvider.database();
      late ElectricityModel electricityData;
      late GeneratorModel generatorData;
      late DeviceModel deviceData;
      db.onValue.listen((DatabaseEvent event) {
        final electricityMap = _getElectricityMap(event);
        electricityData = ElectricityModel.fromMap(electricityMap);

        final generatorMap = _getGeneratorMap(event);
        generatorData = GeneratorModel.fromMap(generatorMap);

        final led1Map = _getLed1Map(event);
        deviceData = DeviceModel.fromMap(led1Map);

        final historyData = _getHistoryData(event);
        emit(HomeSuccess(
            electricityData: electricityData,
            generatorData: generatorData,
            deviceData: deviceData,
            historyData: historyData));
      });
    } catch (error) {
      emit(HomeFaliure());
    }
  }

  void changeGeneratorAutoStartValue(bool value) async {
    _dataProvider.updateGeneratorAutoStart(value);
  }

  void changeLed1ElectricityAutoStart(bool value) async {
    _dataProvider.updateLed1ElectricityAutoStart(value);
  }

  void changeLed1GeneratorAutoStart(bool value) async {
    _dataProvider.updateLed1GeneratorAutoStart(value);
  }

  void switchLed1State(bool value) async {
    _dataProvider.switchLed1State(value);
  }

  WeekHistoryModel getWeekHistory(List<HistoryModel> historyData) {
    DateTime weekDay = DateTime.now().subtract(const Duration(days: 7));
    List<HistoryModel> weekHistoryList = [];
    Map<String, double> weekValuesMap = {
      AppStrings.saturdayShort: 0.0,
      AppStrings.sundayShort: 0.0,
      AppStrings.mondayShort: 0.0,
      AppStrings.tuesdayShort: 0.0,
      AppStrings.wednesdayShort: 0.0,
      AppStrings.thursdayShort: 0.0,
      AppStrings.fridayShort: 0.0,
    };
    for (HistoryModel history in historyData) {
      if (history.from.compareTo(weekDay) > 0) {
        weekHistoryList.add(history);
      }
    }
    for (HistoryModel history in weekHistoryList) {
      for (int i = 0; i < 7; i++) {
        DateTime day = DateTime.now().subtract(Duration(days: i));

        if (history.from.weekday == day.weekday && history.to != null) {
          weekValuesMap.update(
            weekDaysShort[getWeekDayIndex(day) - 1],
            (value) {
              return value + history.to!.difference(history.from).inMinutes;
            },
          );
        }
      }
    }
    int totalCutMinutes = 0;
    weekValuesMap.forEach((key, value) {
      totalCutMinutes += value.round();
    });
    int totalPowerCuts = weekHistoryList.length;
    return WeekHistoryModel(
        totalCutMinutes: totalCutMinutes,
        totalPowerCuts: totalPowerCuts,
        weekData: weekValuesMap);
  }

  Map<String, dynamic> _getElectricityMap(DatabaseEvent event) {
    final electricityVoltage = event.snapshot
        .child(kMainData)
        .child(kElectricity)
        .child(kVoltage)
        .value;
    final electricityLastPowerCut = event.snapshot
        .child(kMainData)
        .child(kElectricity)
        .child(kLastPowerCut)
        .value;
    Map<String, dynamic> electricityMap = {
      kState: electricityVoltage,
      kLastPowerCut: electricityLastPowerCut
    };
    return electricityMap;
  }

  Map<String, dynamic> _getGeneratorMap(DatabaseEvent event) {
    final fuelLevel = event.snapshot.child(kFuelLevel).child(kFuelLevel).value;
    final generatorState =
        event.snapshot.child(kGeneratorState).child(kState).value;
    final generatorAutoStart =
        event.snapshot.child(kGeneratorAutoStart).child(kAutoStart).value;
    Map<String, dynamic> generatorMap = {
      kFuelLevel: fuelLevel,
      kState: generatorState,
      kAutoStart: generatorAutoStart
    };
    return generatorMap;
  }

  Map<String, dynamic> _getLed1Map(DatabaseEvent event) {
    final led1State = event.snapshot.child(kLed1).child(kState).value;
    final led1Generator =
        event.snapshot.child(kLed1Auto).child(kGenerator).value;
    final led1Electricity =
        event.snapshot.child(kLed1Auto).child(kElectricity).value;
    Map<String, dynamic> led1Map = {
      kState: led1State,
      kElectricity: led1Electricity,
      kGenerator: led1Generator
    };
    return led1Map;
  }

  List<HistoryModel> _getHistoryData(DatabaseEvent event) {
    final fetchedHistory = event.snapshot.child(kHistory).value;
    Map<String, Map<String, int>> fetchedHistoryMap = {};

    Map<String, dynamic>.from(fetchedHistory as dynamic).forEach((key, value) {
      fetchedHistoryMap.addAll({key: Map<String, int>.from(value as dynamic)});
    });
    //sort
    fetchedHistoryMap = Map.fromEntries(fetchedHistoryMap.entries.toList()
      ..sort((e1, e2) {
        return e1.value.values
            .elementAt(0)
            .compareTo(e2.value.values.elementAt(0));
      }));
    List<HistoryModel> list = [];
    for (int i = 0; i < fetchedHistoryMap.length; i += 2) {
      DateTime from = DateTime.fromMillisecondsSinceEpoch(
          fetchedHistoryMap.values.elementAt(i)[kFrom]!).subtract(const Duration(hours: 2));
      DateTime? to;
      if (i < fetchedHistoryMap.length - 1) {
        to = DateTime.fromMillisecondsSinceEpoch(
            fetchedHistoryMap.values.elementAt(i + 1)[kTo]!).subtract(const Duration(hours: 2));
      }
      list.add(
        HistoryModel(from: from, to: to),
      );
    }
    return list;
  }
}
