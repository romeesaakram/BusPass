import 'dart:convert';

class ConductorModel {
  int id;
  int user_id;
  String latitude;
  String longitude;
  ConductorModel({
    required this.id,
    required this.user_id,
    required this.latitude,
    required this.longitude,
  });

  ConductorModel copyWith({
    int? id,
    int? user_id,
    String? latitude,
    String? longitude,
  }) {
    return ConductorModel(
      id: id ?? this.id,
      user_id: user_id ?? this.user_id,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'user_id': user_id});
    result.addAll({'latitude': latitude});
    result.addAll({'longitude': longitude});

    return result;
  }

  factory ConductorModel.fromMap(Map<String, dynamic> map) {
    return ConductorModel(
      id: map['id']?.toInt() ?? 0,
      user_id: map['user_id']?.toInt() ?? 0,
      latitude: map['latitude'] ?? '',
      longitude: map['longitude'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ConductorModel.fromJson(String source) =>
      ConductorModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ConductorModel(id: $id, user_id: $user_id, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ConductorModel &&
        other.id == id &&
        other.user_id == user_id &&
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        user_id.hashCode ^
        latitude.hashCode ^
        longitude.hashCode;
  }
}
