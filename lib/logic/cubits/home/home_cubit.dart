import 'package:arm_project/data/dataproviders/firebase_dataprovider.dart';
import 'package:arm_project/data/models/device_model.dart';
import 'package:arm_project/data/models/electricity_model.dart';
import 'package:arm_project/data/models/generator_model.dart';
import 'package:arm_project/utils/constants.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:meta/meta.dart';

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

        emit(HomeSuccess(
            electricityData: electricityData,
            generatorData: generatorData,
            deviceData: deviceData));
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
    final fuelLevel = event.snapshot
        .child(kMainData)
        .child(kGenerator)
        .child(kFuelLevel)
        .value;
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
}
