// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class ElectricityModel extends Equatable {
  final bool state;
  final DateTime lastPowerCut;
  const ElectricityModel({
    required this.state,
    required this.lastPowerCut,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'state': state,
      'lastPowerCut': lastPowerCut.millisecondsSinceEpoch,
    };
  }

  factory ElectricityModel.fromMap(Map<String, dynamic> map) {
    return ElectricityModel(
      state: map['state'] as bool,
      lastPowerCut:
          DateTime.fromMillisecondsSinceEpoch(map['lastPowerCut'] as int)
              .subtract(const Duration(hours: 2)),
    );
  }

  String toJson() => json.encode(toMap());

  factory ElectricityModel.fromJson(String source) =>
      ElectricityModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [state, lastPowerCut];
}
