// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class HistoryModel extends Equatable {
  final DateTime from;
  final DateTime? to;
  const HistoryModel({
    required this.from,
    this.to,
  });
  
  @override
  List<Object?> get props => [to,from];
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'from': from.millisecondsSinceEpoch,
      'to': to?.millisecondsSinceEpoch,
    };
  }

  factory HistoryModel.fromMap(Map<String, dynamic> map) {
    return HistoryModel(
      from: DateTime.fromMillisecondsSinceEpoch(map['from'] as int),
      to: map['to'] != null ? DateTime.fromMillisecondsSinceEpoch(map['to'] as int) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory HistoryModel.fromJson(String source) => HistoryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
