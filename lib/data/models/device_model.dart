// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:arm_project/utils/enums.dart';

class DeviceModel {
  final int id;
  final String name;
  final DeviceChnageState electricity;
  final DeviceChnageState generator;
  final bool state;
  DeviceModel({
    required this.id,
    required this.name,
    required this.electricity,
    required this.generator,
    required this.state,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'electricity': electricity.index,
      'generator': generator.index,
      'state': state,
    };
  }

  factory DeviceModel.fromMap(Map<String, dynamic> map) {
    return DeviceModel(
      id: map['id'] as int,
      name: map['name'] as String,
      electricity: DeviceChnageState.values[map['electricity'] as int],
      generator: DeviceChnageState.values[map['generator'] as int],
      state: map['state'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory DeviceModel.fromJson(String source) => DeviceModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
