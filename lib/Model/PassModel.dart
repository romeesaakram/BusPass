import 'dart:convert';

class PassModel {
  int? pass_id;
  String? passexpiry;
  int? remainingjourneys;
  int? totaljourneys;
  PassModel({
    this.pass_id,
    this.passexpiry,
    this.remainingjourneys,
    this.totaljourneys,
  });

  PassModel copyWith({
    int? pass_id,
    String? passexpiry,
    int? remainingjourneys,
    int? totaljourneys,
  }) {
    return PassModel(
      pass_id: pass_id ?? this.pass_id,
      passexpiry: passexpiry ?? this.passexpiry,
      remainingjourneys: remainingjourneys ?? this.remainingjourneys,
      totaljourneys: totaljourneys ?? this.totaljourneys,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (pass_id != null) {
      result.addAll({'pass_id': pass_id});
    }
    if (passexpiry != null) {
      result.addAll({'passexpiry': passexpiry});
    }
    if (remainingjourneys != null) {
      result.addAll({'remainingjourneys': remainingjourneys});
    }
    if (totaljourneys != null) {
      result.addAll({'totaljourneys': totaljourneys});
    }

    return result;
  }

  factory PassModel.fromMap(Map<String, dynamic> map) {
    return PassModel(
      pass_id: map['pass_id']?.toInt(),
      passexpiry: map['passexpiry'],
      remainingjourneys: map['remainingjourneys']?.toInt(),
      totaljourneys: map['totaljourneys']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory PassModel.fromJson(String source) =>
      PassModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PassModel(pass_id: $pass_id, passexpiry: $passexpiry, remainingjourneys: $remainingjourneys, totaljourneys: $totaljourneys)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PassModel &&
        other.pass_id == pass_id &&
        other.passexpiry == passexpiry &&
        other.remainingjourneys == remainingjourneys &&
        other.totaljourneys == totaljourneys;
  }

  @override
  int get hashCode {
    return pass_id.hashCode ^
        passexpiry.hashCode ^
        remainingjourneys.hashCode ^
        totaljourneys.hashCode;
  }
}
