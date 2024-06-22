import 'dart:convert';

class RouteInfoModel {
  int? Id;
  String? Name;
  String? Timing;
  String? Longitude;
  String? Latitude;
  int? Route;

  RouteInfoModel({
    this.Id,
    this.Name,
    this.Timing,
    this.Longitude,
    this.Latitude,
    this.Route,
  });

  factory RouteInfoModel.fromJson(Map<String, dynamic> json) {
    return RouteInfoModel(
      Id: json['Id'],
      Name: json['Name'],
      Timing: json['Timing'],
      Longitude: json['Longitude'],
      Latitude: json['Latitude'],
      Route: json['Route'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': Id,
      'Name': Name,
      'Timing': Timing,
      'Longitude': Longitude,
      'Latitude': Latitude,
      'Route': Route,
    };
  }
}