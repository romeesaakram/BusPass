import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:fyp_project/Model/History.dart';
import 'package:fyp_project/Model/PassModel.dart';

class Allchildshistorymodel {
  int studentid;
  String regno;
  String username;
  PassModel pass;
  List<HistoryModel> pickTimings;
  Allchildshistorymodel({
    required this.studentid,
    required this.regno,
    required this.username,
    required this.pass,
    required this.pickTimings,
  });

  Allchildshistorymodel copyWith({
    int? studentid,
    String? regno,
    String? username,
    PassModel? pass,
    List<HistoryModel>? pickTimings,
  }) {
    return Allchildshistorymodel(
      studentid: studentid ?? this.studentid,
      regno: regno ?? this.regno,
      username: username ?? this.username,
      pass: pass ?? this.pass,
      pickTimings: pickTimings ?? this.pickTimings,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'studentid': studentid});
    result.addAll({'regno': regno});
    result.addAll({'username': username});
    result.addAll({'pass': pass.toMap()});
    result.addAll({'pickTimings': pickTimings.map((x) => x.toMap()).toList()});

    return result;
  }

  factory Allchildshistorymodel.fromMap(Map<String, dynamic> map) {
    return Allchildshistorymodel(
      studentid: map['studentid']?.toInt() ?? 0,
      regno: map['regno'] ?? '',
      username: map['username'] ?? '',
      pass: PassModel.fromMap(map['pass']),
      pickTimings: List<HistoryModel>.from(
          map['pickTimings']?.map((x) => HistoryModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Allchildshistorymodel.fromJson(String source) =>
      Allchildshistorymodel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Allchildshistorymodel(studentid: $studentid, regno: $regno, username: $username, pass: $pass, pickTimings: $pickTimings)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Allchildshistorymodel &&
        other.studentid == studentid &&
        other.regno == regno &&
        other.username == username &&
        other.pass == pass &&
        listEquals(other.pickTimings, pickTimings);
  }

  @override
  int get hashCode {
    return studentid.hashCode ^
        regno.hashCode ^
        username.hashCode ^
        pass.hashCode ^
        pickTimings.hashCode;
  }
}
