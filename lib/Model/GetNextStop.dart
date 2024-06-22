

import 'dart:convert';

class NextStop{
 int? Id;
  String? Name;
  String? Timing;
  String? Longitude;
  String? Latitude;
  int? route;

  NextStop(
      {this.Id,
      this.Name,
      this.Timing,
      this.Longitude,
      this.Latitude,
      this.route});

  NextStop.fromJson(Map<String, dynamic> json) {
    Id = json['Id'];
    Name = json['Name'];
    Timing = json['Timing'];
    Longitude = json['Longitude'];
    Latitude = json['Latitude'];
    route = json['Route'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.Id;
    data['Name'] = this.Name;
    data['Timing'] = this.Timing;
    data['Longitude'] = this.Longitude;
    data['Latitude'] = this.Latitude;
    data['Route'] = this.route;
    return data;
  }
}