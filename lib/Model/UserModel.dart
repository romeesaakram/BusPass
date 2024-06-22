import 'package:intl/intl.dart';

class User {
  Admin admins;
  Conductor conductors;
  Parent parents;
  Student students;
  String userRole;

  User({
    required this.admins,
    required this.conductors,
    required this.parents,
    required this.students,
    required this.userRole,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      admins: json['Admins'] != null
          ? Admin.fromJson(json['Admins'])
          : Admin.dummy(),
      conductors: json['Conductors'] != null
          ? Conductor.fromJson(json['Conductors'])
          : Conductor.dummy(),
      parents: json['Parents'] != null
          ? Parent.fromJson(json['Parents'])
          : Parent.dummy(),
      students: json['Students'] != null
          ? Student.fromJson(json['Students'])
          : Student.dummy(),
      userRole: json['userRole'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Admins': admins.toJson(),
      'Conductors': conductors.toJson(),
      'Parents': parents.toJson(),
      'Students': students.toJson(),
      'userRole': userRole,
    };
  }
}

class Admin {
  int Id;
  String Name;
  String Contact;
  String Gender;
  int UserId;
  String UserName;
  String Password;

  Admin({
    required this.Id,
    required this.Name,
    required this.Contact,
    required this.Gender,
    required this.UserId,
    required this.UserName,
    required this.Password,
  });

  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
      Id: json['Id'],
      Name: json['Name'],
      Contact: json['Contact'],
      Gender: json['Gender'],
      UserId: json['UserId'],
      UserName: json['UserName'],
      Password: json['Password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': Id,
      'Name': Name,
      'Contact': Contact,
      'Gender': Gender,
      'UserId': UserId,
      'UserName': UserName,
      'Password': Password,
    };
  }

  static Admin dummy() {
    return Admin(
      Id: 0,
      Name: '',
      Contact: '',
      Gender: '',
      UserId: 0,
      UserName: '',
      Password: '',
    );
  }
}

// Similar updates for Conductor, Parent, and Student classes

class Conductor {
  int Id;
  String Name;
  String Contact;
  int UserId;
  String UserName;
  String Password;
  int BusId;
  String BusRegNo;
  int TotalSeats;

  Conductor({
    required this.Id,
    required this.Name,
    required this.Contact,
    required this.UserId,
    required this.UserName,
    required this.Password,
    required this.BusId,
    required this.BusRegNo,
    required this.TotalSeats,
  });

  factory Conductor.fromJson(Map<String, dynamic> json) {
    return Conductor(
      Id: json['Id'],
      Name: json['Name'],
      Contact: json['Contact'],
      UserId: json['UserId'],
      UserName: json['UserName'],
      Password: json['Password'],
      BusId: json['BusId'],
      BusRegNo: json['BusRegNo'],
      TotalSeats: json['TotalSeats'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': Id,
      'Name': Name,
      'Contact': Contact,
      'UserId': UserId,
      'UserName': UserName,
      'Password': Password,
      'BusId': BusId,
      'BusRegNo': BusRegNo,
      'TotalSeats': TotalSeats,
    };
  }

  static Conductor dummy() {
    return Conductor(
      Id: 0,
      Name: '',
      Contact: '',
      UserId: 0,
      UserName: '',
      Password: '',
      BusId: 0,
      BusRegNo: '',
      TotalSeats: 0,
    );
  }
}

class Parent {
  int Id;
  String Name;
  String Contact;
  int ChildrenEnroll;
  int UserId;
  String UserName;
  String Password;

  Parent({
    required this.Id,
    required this.Name,
    required this.Contact,
    required this.ChildrenEnroll,
    required this.UserId,
    required this.UserName,
    required this.Password,
  });

  factory Parent.fromJson(Map<String, dynamic> json) {
    return Parent(
      Id: json['Id'],
      Name: json['Name'],
      Contact: json['Contact'],
      ChildrenEnroll: json['ChildrenEnroll'],
      UserId: json['UserId'],
      UserName: json['UserName'],
      Password: json['Password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': Id,
      'Name': Name,
      'Contact': Contact,
      'ChildrenEnroll': ChildrenEnroll,
      'UserId': UserId,
      'UserName': UserName,
      'Password': Password,
    };
  }

  static Parent dummy() {
    return Parent(
        Id: 0,
        Name: '',
        Contact: '',
        ChildrenEnroll: 0,
        UserId: 0,
        UserName: '',
        Password: '');
  }
}

class Student {
  int Id;
  String Name;
  String Gender;
  String RegNo;
  String Contact;
  String UserName;
  String Password;
  String PassStatus;
  String PassExpiry;
  int TotalJourneys;
  int RemainingJourneys;
  int ParentId;
  int UserId;
  int PassId;

  Student({
    required this.Id,
    required this.Name,
    required this.Gender,
    required this.RegNo,
    required this.Contact,
    required this.UserName,
    required this.Password,
    required this.PassStatus,
    required this.PassExpiry,
    required this.TotalJourneys,
    required this.RemainingJourneys,
    required this.ParentId,
    required this.UserId,
    required this.PassId,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      Id: json['Id'],
      Name: json['Name'],
      Gender: json['Gender'],
      RegNo: json['RegNo'],
      Contact: json['Contact'],
      UserName: json['UserName'],
      Password: json['Password'],
      PassStatus: json['PassStatus'],
      PassExpiry: json['PassExpiry'].toString(),
      TotalJourneys: json['TotalJourneys'],
      RemainingJourneys: json['RemainingJourneys'],
      ParentId: json['ParentId'],
      UserId: json['UserId'],
      PassId: json['PassId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': Id,
      'Name': Name,
      'Gender': Gender,
      'RegNo': RegNo,
      'Contact': Contact,
      'UserName': UserName,
      'Password': Password,
      'PassStatus': PassStatus,
      'PassExpiry': PassExpiry,
      'TotalJourneys': TotalJourneys,
      'RemainingJourneys': RemainingJourneys,
      'ParentId': ParentId,
      'UserId': UserId,
      'PassId': PassId,
    };
  }

  static Student dummy() {
    return Student(
      Id: 0,
      Name: '',
      Gender: '',
      RegNo: '',
      Contact: '',
      UserName: '',
      Password: '',
      PassStatus: '',
      PassExpiry: '',
      TotalJourneys: 0,
      RemainingJourneys: 0,
      ParentId: 0,
      UserId: 0,
      PassId: 0,
    );
  }
}
