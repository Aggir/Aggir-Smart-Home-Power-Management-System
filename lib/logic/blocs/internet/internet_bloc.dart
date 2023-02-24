import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  StreamSubscription? _subscription;

  InternetBloc() : super(InternetInitial()) {
    on<InternetEvent>((event, emit) {
      if (event is ConnectEvent) {
        emit(ConnectedState());
      } else if (event is DisconnectEvent) {
        emit(DisconnectedState());
      }
    });
    _subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        add(ConnectEvent());
      } else if (result == ConnectivityResult.none) {
        add(DisconnectEvent());
      }
    });
  }

  @override
  Future<void> close() {
    if (_subscription != null) {
      _subscription!.cancel();
    }
    return super.close();
  }
}
