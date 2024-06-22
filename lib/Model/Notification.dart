import 'dart:convert';

class NotificationData {
   int? Id;
  String? Date;
  String? Time;
  String? Type;
  String? Description;
  int? UserID;
  int? NotificationRead;

   NotificationData(
      {this.Id,
      this.Date,
      this.Time,
      this.Type,
      this.Description,
      this.UserID,
      this.NotificationRead});

 NotificationData.fromJson(Map<String, dynamic> json) {
    Id = json['Id'];
    Date = json['Date'];
    Time = json['Time'];
    Type = json['Type'];
    Description = json['Description'];
    UserID = json['UserID'];
    NotificationRead = json['NotificationRead'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.Id;
    data['Date'] = this.Date;
    data['Time'] = this.Time;
    data['Type'] = this.Type;
    data['Description'] = this.Description;
    data['UserID'] = this.UserID;
    data['NotificationRead'] = this.NotificationRead;
    return data;
  }
}