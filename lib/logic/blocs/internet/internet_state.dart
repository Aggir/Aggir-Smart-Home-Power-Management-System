part of 'internet_bloc.dart';

@immutable
abstract class InternetState {}

class InternetInitial extends InternetState {}
class ConnectedState extends InternetState {}
class DisconnectedState extends InternetState {}
