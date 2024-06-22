  class QrScan{
  int? Id;
  String? Name;
  String? Gender;
  String? RegNo;
  Null? Contact;
  Null? UserName;
  Null? Password;
  String? PassStatus;
  String? PassExpiry;
  int? TotalJourneys;
  int? RemainingJourneys;
  int? ParentId;
  int? UserId;
  int? PassId;

  QrScan(
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

 QrScan.fromJson(Map<String, dynamic> json) {
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