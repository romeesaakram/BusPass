import 'dart:convert';

import 'package:fyp_project/Model/BussModel.dart';

import 'BussModel.dart';

class BussModel {
  int? bus_id;
  String? regno;
  int totalSeats;
  
  BussModel({
    this.bus_id,
    this.regno,
    required this.totalSeats,
  });

  BussModel copyWith({
    int? bus_id,
    String? regno,
    int? totalSeats,
  }) {
    return BussModel(
      bus_id: bus_id ?? this.bus_id,
      regno: regno ?? this.regno,
      totalSeats: totalSeats ?? this.totalSeats,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (bus_id != null) {
      result.addAll({'bus_id': bus_id});
    }
    if (regno != null) {
      result.addAll({'regno': regno});
    }
    result.addAll({'totalSeats': totalSeats});

    return result;
  }

  factory BussModel.fromMap(Map<String, dynamic> map) {
    return BussModel(
      bus_id: map['bus_id']?.toInt(),
      regno: map['regno'],
      totalSeats: map['totalSeats']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory BussModel.fromJson(String source) =>
      BussModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'BussModel(bus_id: $bus_id, regno: $regno, totalSeats: $totalSeats)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BussModel &&
        other.bus_id == bus_id &&
        other.regno == regno &&
        other.totalSeats == totalSeats;
  }

  @override
  int get hashCode => bus_id.hashCode ^ regno.hashCode ^ totalSeats.hashCode;
}

