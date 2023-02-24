part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final ElectricityModel electricityData;
  final GeneratorModel generatorData;
  final DeviceModel deviceData;
  HomeSuccess({
    required this.electricityData,
    required this.generatorData,
    required this.deviceData,
  });
}

class HomeFaliure extends HomeState {}
