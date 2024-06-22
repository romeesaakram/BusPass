class StopInfoModel{
  int? Id;
  String? Name;
  String? Timing;
  bool? isFavourite;
  String? Longitude;
  String? Latitude;
  int? Route;

  StopInfoModel(
      {this.Id,
      this.Name,
      this.Timing,
      this.isFavourite,
      this.Longitude,
      this.Latitude,
      this.Route});

StopInfoModel.fromJson(Map<String, dynamic> json) {
    Id = json['Id'];
    Name = json['Name'];
    Timing = json['Timing'];
    isFavourite = json['isFavourite'];
    Longitude = json['Longitude'];
    Latitude = json['Latitude'];
    Route = json['Route'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.Id;
    data['Name'] = this.Name;
    data['Timing'] = this.Timing;
    data['isFavourite'] = this.isFavourite;
    data['Longitude'] = this.Longitude;
    data['Latitude'] = this.Latitude;
    data['Route'] = this.Route;
    return data;
  }
}