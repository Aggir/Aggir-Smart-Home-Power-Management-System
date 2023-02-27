// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:arm_project/utils/enums.dart';
import 'package:equatable/equatable.dart';

class DeviceModel extends Equatable {
  final bool electricity;
  final bool generator;
  final bool state;
  const DeviceModel({
    required this.electricity,
    required this.generator,
    required this.state,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'electricity': electricity,
      'generator': generator,
      'state': state,
    };
  }

  factory DeviceModel.fromMap(Map<String, dynamic> map) {
    return DeviceModel(
      electricity:
          (map['electricity'] as bool),
      generator:
         (map['generator'] as bool),
      state: map['state'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory DeviceModel.fromJson(String source) =>
      DeviceModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [electricity, generator, state];
}
