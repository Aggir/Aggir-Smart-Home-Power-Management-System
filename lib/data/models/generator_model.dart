// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:arm_project/utils/enums.dart';
import 'package:equatable/equatable.dart';

class GeneratorModel extends Equatable {
  final bool state;
  final bool autoStart;
  final FuelLevelEnum fuelLevel;

  const GeneratorModel({
    required this.state,
    required this.autoStart,
    required this.fuelLevel,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'state': state,
      'autoStart': autoStart,
      'fuelLevel': fuelLevel,
    };
  }

  factory GeneratorModel.fromMap(Map<String, dynamic> map) {
    return GeneratorModel(
      state: map['state'] as bool,
      autoStart: map['autoStart'] as bool,
      fuelLevel: FuelLevelEnum.values
          .byName((map['fuelLevel'] as String).toLowerCase()),
    );
  }

  String toJson() => json.encode(toMap());

  factory GeneratorModel.fromJson(String source) =>
      GeneratorModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [state, autoStart, fuelLevel];
}
