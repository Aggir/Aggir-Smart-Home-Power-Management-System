part of 'internet_bloc.dart';

@immutable
abstract class InternetEvent {}

class ConnectEvent extends InternetEvent{
}

class DisconnectEvent extends InternetEvent{}
