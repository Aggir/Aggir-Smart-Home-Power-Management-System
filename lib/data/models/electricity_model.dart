// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ElectricityModel {
  final bool state;
  final DateTime lastPowerCut;
  ElectricityModel({
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
      lastPowerCut: (map['lastPowerCut'] as Timestamp).toDate(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ElectricityModel.fromJson(String source) =>
      ElectricityModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
