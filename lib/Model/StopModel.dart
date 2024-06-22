import 'dart:convert';

class StopModel {
  int id;
  String name;
  String latitude;
  String? stoptiming;
  String longitude;
  StopModel({
    required this.id,
    required this.name,
    required this.latitude,
    this.stoptiming,
    required this.longitude,
  });

  StopModel copyWith({
    int? id,
    String? name,
    String? latitude,
    String? stoptiming,
    String? longitude,
  }) {
    return StopModel(
      id: id ?? this.id,
      name: name ?? this.name,
      latitude: latitude ?? this.latitude,
      stoptiming: stoptiming ?? this.stoptiming,
      longitude: longitude ?? this.longitude,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'latitude': latitude});
    if (stoptiming != null) {
      result.addAll({'stoptiming': stoptiming});
    }
    result.addAll({'longitude': longitude});

    return result;
  }

  factory StopModel.fromMap(Map<String, dynamic> map) {
    return StopModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      latitude: map['latitude'] ?? '',
      stoptiming: map['stoptiming'],
      longitude: map['longitude'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory StopModel.fromJson(String source) =>
      StopModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'StopModel(id: $id, name: $name, latitude: $latitude, stoptiming: $stoptiming, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StopModel &&
        other.id == id &&
        other.name == name &&
        other.latitude == latitude &&
        other.stoptiming == stoptiming &&
        other.longitude == longitude;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        latitude.hashCode ^
        stoptiming.hashCode ^
        longitude.hashCode;
  }
}
