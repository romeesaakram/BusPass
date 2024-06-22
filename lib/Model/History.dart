import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:fyp_project/Model/BussModel.dart';
import 'package:fyp_project/Model/ConductorModel.dart';
import 'package:fyp_project/Model/PassModel.dart';
import 'package:fyp_project/Model/StopModel.dart';

class HistoryModel {
  int? student_id;
  String? regno;
  String? stopName;
  String? username;
  PassModel? pass;
  BussModel? bus;
  String? date;
  ConductorModel conductor;
  String? time;
  List<StopModel> routes;
  String? type;
  // void routeId;
  int? routeId;
  HistoryModel({
    this.student_id,
    this.regno,
    this.stopName,
    this.username,
    this.pass,
    this.bus,
    this.date,
    required this.conductor,
    this.time,
    required this.routes,
    this.type,
    this.routeId,
  });

  HistoryModel copyWith({
    int? student_id,
    String? regno,
    String? stopName,
    String? username,
    PassModel? pass,
    BussModel? bus,
    String? date,
    ConductorModel? conductor,
    String? time,
    List<StopModel>? routes,
    String? type,
    int? routeId,
  }) {
    return HistoryModel(
      student_id: student_id ?? this.student_id,
      regno: regno ?? this.regno,
      stopName: stopName ?? this.stopName,
      username: username ?? this.username,
      pass: pass ?? this.pass,
      bus: bus ?? this.bus,
      date: date ?? this.date,
      conductor: conductor ?? this.conductor,
      time: time ?? this.time,
      routes: routes ?? this.routes,
      type: type ?? this.type,
      routeId: routeId ?? this.routeId,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (student_id != null) {
      result.addAll({'student_id': student_id});
    }
    if (regno != null) {
      result.addAll({'regno': regno});
    }
    if (stopName != null) {
      result.addAll({'stopName': stopName});
    }
    if (username != null) {
      result.addAll({'username': username});
    }
    if (pass != null) {
      result.addAll({'pass': pass!.toMap()});
    }
    if (bus != null) {
      result.addAll({'bus': bus!.toMap()});
    }
    if (date != null) {
      result.addAll({'date': date});
    }
    result.addAll({'conductor': conductor.toMap()});
    if (time != null) {
      result.addAll({'time': time});
    }
    result.addAll({'routes': routes.map((x) => x.toMap()).toList()});
    if (type != null) {
      result.addAll({'type': type});
    }
    if (routeId != null) {
      result.addAll({'routeId': routeId});
    }

    return result;
  }

  factory HistoryModel.fromMap(Map<String, dynamic> map) {
    return HistoryModel(
      student_id: map['student_id']?.toInt(),
      regno: map['regno'],
      stopName: map['stopName'],
      username: map['username'],
      pass: map['pass'] != null ? PassModel.fromMap(map['pass']) : null,
      bus: map['bus'] != null ? BussModel.fromMap(map['bus']) : null,
      date: map['date'],
      conductor: ConductorModel.fromMap(map['conductor']),
      time: map['time'],
      routes:
          List<StopModel>.from(map['routes']?.map((x) => StopModel.fromMap(x))),
      type: map['type'],
      routeId: map['routeId']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory HistoryModel.fromJson(String source) =>
      HistoryModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'HistoryModel(student_id: $student_id, regno: $regno, stopName: $stopName, username: $username, pass: $pass, bus: $bus, date: $date, conductor: $conductor, time: $time, routes: $routes, type: $type, routeId: $routeId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HistoryModel &&
        other.student_id == student_id &&
        other.regno == regno &&
        other.stopName == stopName &&
        other.username == username &&
        other.pass == pass &&
        other.bus == bus &&
        other.date == date &&
        other.conductor == conductor &&
        other.time == time &&
        listEquals(other.routes, routes) &&
        other.type == type &&
        other.routeId == routeId;
  }

  @override
  int get hashCode {
    return student_id.hashCode ^
        regno.hashCode ^
        stopName.hashCode ^
        username.hashCode ^
        pass.hashCode ^
        bus.hashCode ^
        date.hashCode ^
        conductor.hashCode ^
        time.hashCode ^
        routes.hashCode ^
        type.hashCode ^
        routeId.hashCode;
  }
}
