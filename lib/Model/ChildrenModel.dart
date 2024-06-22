import 'dart:convert';

class ChildrenModel {
  ChildDetails? childDetails;
  ChildTimings? childTimings;

  ChildrenModel({this.childDetails, this.childTimings});

 ChildrenModel.fromJson(Map<String, dynamic> json) {
    childDetails = json['childDetails'] != null
        ? new ChildDetails.fromJson(json['childDetails'])
        : null;
    childTimings = json['childTimings'] != null
        ? new ChildTimings.fromJson(json['childTimings'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.childDetails != null) {
      data['childDetails'] = this.childDetails!.toJson();
    }
    if (this.childTimings != null) {
      data['childTimings'] = this.childTimings!.toJson();
    }
    return data;
  }
}

class ChildDetails {
  int? Id;
  String? Name;
  String? Gender;
  String? RegNo;
  String? Contact;
  String? UserName; // Change Null? to String?
  String? Password; // Change Null? to String?
  String? PassStatus;
  String? PassExpiry;
  int? TotalJourneys;
  int? RemainingJourneys;
  int? ParentId;
  int? UserId;
  int? PassId;

  ChildDetails(
      {this.Id,
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
      this.PassId});

  ChildDetails.fromJson(Map<String, dynamic> json) {
    Id = json['Id'];
    Name = json['Name'];
    Gender = json['Gender'];
    RegNo = json['RegNo'];
    Contact = json['Contact'];
    UserName = json['UserName'];
    Password = json['Password'];
    PassStatus = json['PassStatus'];
    PassExpiry = json['PassExpiry'];
    TotalJourneys = json['TotalJourneys'];
    RemainingJourneys = json['RemainingJourneys'];
    ParentId = json['ParentId'];
    UserId = json['UserId'];
    PassId = json['PassId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.Id;
    data['Name'] = this.Name;
    data['Gender'] = this.Gender;
    data['RegNo'] = this.RegNo;
    data['Contact'] = this.Contact;
    data['UserName'] = this.UserName;
    data['Password'] = this.Password;
    data['PassStatus'] = this.PassStatus;
    data['PassExpiry'] = this.PassExpiry;
    data['TotalJourneys'] = this.TotalJourneys;
    data['RemainingJourneys'] = this.RemainingJourneys;
    data['ParentId'] = this.ParentId;
    data['UserId'] = this.UserId;
    data['PassId'] = this.PassId;
    return data;
  }
}

class ChildTimings {
  String? PickupCheckin; // Change Null? to String?
  String? PickupCheckout; // Change Null? to String?
  String? DropoffCheckin; // Change Null? to String?
  String? DropoffCheckout; // Change Null? to String?


  ChildTimings(
      {this.PickupCheckin,
      this.PickupCheckout,
      this.DropoffCheckin,
      this.DropoffCheckout});

  ChildTimings.fromJson(Map<String, dynamic> json) {
    PickupCheckin = json['Pickup_Checkin'];
    PickupCheckout = json['Pickup_Checkout'];
    DropoffCheckin = json['Dropoff_Checkin'];
    DropoffCheckout = json['Dropoff_Checkout'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Pickup_Checkin'] = this.PickupCheckin;
    data['Pickup_Checkout'] = this.PickupCheckout;
    data['Dropoff_Checkin'] = this.DropoffCheckin;
    data['Dropoff_Checkout'] = this.DropoffCheckout;
    return data;
  }
}