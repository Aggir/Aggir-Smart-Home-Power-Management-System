// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class GeneratorModel {
  final bool state;
  final bool autoStart;
  final int fuelLevel;
  
  GeneratorModel({
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
      fuelLevel: map['fuelLevel'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory GeneratorModel.fromJson(String source) => GeneratorModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
