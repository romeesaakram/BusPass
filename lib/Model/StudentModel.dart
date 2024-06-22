import 'dart:convert';

class StudentModel {
  int? Id;
  String? Name;
  String? Gender;
  String? RegNo;
  String? Contact;
  String? UserName;
  String? Password;
  String? PassStatus;
  String? PassExpiry;
  int? TotalJourneys;
  int? RemainingJourneys;
  int? ParentId;
  int? UserId;
  int? PassId;
  StudentModel({
    this.Id,
    this.Name,
    this.Gender,
    this.RegNo,
    this.Contact,
    this.UserName,
    this.Password,
    this.PassStatus,
    this.PassExpiry,
    this.TotalJourneys,
    this.RemainingJourneys,
    this.ParentId,
    this.UserId,
    this.PassId,
  });

  StudentModel copyWith({
    int? Id,
    String? Name,
    String? Gender,
    String? RegNo,
    String? Contact,
    String? UserName,
    String? Password,
    String? PassStatus,
    String? PassExpiry,
    int? TotalJourneys,
    int? RemainingJourneys,
    int? ParentId,
    int? UserId,
    int? PassId,
  }) {
    return StudentModel(
      Id: Id ?? this.Id,
      Name: Name ?? this.Name,
      Gender: Gender ?? this.Gender,
      RegNo: RegNo ?? this.RegNo,
      Contact: Contact ?? this.Contact,
      UserName: UserName ?? this.UserName,
      Password: Password ?? this.Password,
      PassStatus: PassStatus ?? this.PassStatus,
      PassExpiry: PassExpiry ?? this.PassExpiry,
      TotalJourneys: TotalJourneys ?? this.TotalJourneys,
      RemainingJourneys: RemainingJourneys ?? this.RemainingJourneys,
      ParentId: ParentId ?? this.ParentId,
      UserId: UserId ?? this.UserId,
      PassId: PassId ?? this.PassId,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (Id != null) {
      result.addAll({'Id': Id});
    }
    if (Name != null) {
      result.addAll({'Name': Name});
    }
    if (Gender != null) {
      result.addAll({'Gender': Gender});
    }
    if (RegNo != null) {
      result.addAll({'RegNo': RegNo});
    }
    if (Contact != null) {
      result.addAll({'Contact': Contact});
    }
    if (UserName != null) {
      result.addAll({'UserName': UserName});
    }
    if (Password != null) {
      result.addAll({'Password': Password});
    }
    if (PassStatus != null) {
      result.addAll({'PassStatus': PassStatus});
    }
    if (PassExpiry != null) {
      result.addAll({'PassExpiry': PassExpiry});
    }
    if (TotalJourneys != null) {
      result.addAll({'TotalJourneys': TotalJourneys});
    }
    if (RemainingJourneys != null) {
      result.addAll({'RemainingJourneys': RemainingJourneys});
    }
    if (ParentId != null) {
      result.addAll({'ParentId': ParentId});
    }
    if (UserId != null) {
      result.addAll({'UserId': UserId});
    }
    if (PassId != null) {
      result.addAll({'PassId': PassId});
    }

    return result;
  }

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      Id: map['Id']?.toInt(),
      Name: map['Name'],
      Gender: map['Gender'],
      RegNo: map['RegNo'],
      Contact: map['Contact'],
      UserName: map['UserName'],
      Password: map['Password'],
      PassStatus: map['PassStatus'],
      PassExpiry: map['PassExpiry'],
      TotalJourneys: map['TotalJourneys']?.toInt(),
      RemainingJourneys: map['RemainingJourneys']?.toInt(),
      ParentId: map['ParentId']?.toInt(),
      UserId: map['UserId']?.toInt(),
      PassId: map['PassId']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentModel.fromJson(String source) =>
      StudentModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'StudentModel(Id: $Id, Name: $Name, Gender: $Gender, RegNo: $RegNo, Contact: $Contact, UserName: $UserName, Password: $Password, PassStatus: $PassStatus, PassExpiry: $PassExpiry, TotalJourneys: $TotalJourneys, RemainingJourneys: $RemainingJourneys, ParentId: $ParentId, UserId: $UserId, PassId: $PassId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StudentModel &&
        other.Id == Id &&
        other.Name == Name &&
        other.Gender == Gender &&
        other.RegNo == RegNo &&
        other.Contact == Contact &&
        other.UserName == UserName &&
        other.Password == Password &&
        other.PassStatus == PassStatus &&
        other.PassExpiry == PassExpiry &&
        other.TotalJourneys == TotalJourneys &&
        other.RemainingJourneys == RemainingJourneys &&
        other.ParentId == ParentId &&
        other.UserId == UserId &&
        other.PassId == PassId;
  }

  @override
  int get hashCode {
    return Id.hashCode ^
        Name.hashCode ^
        Gender.hashCode ^
        RegNo.hashCode ^
        Contact.hashCode ^
        UserName.hashCode ^
        Password.hashCode ^
        PassStatus.hashCode ^
        PassExpiry.hashCode ^
        TotalJourneys.hashCode ^
        RemainingJourneys.hashCode ^
        ParentId.hashCode ^
        UserId.hashCode ^
        PassId.hashCode;
  }
}
