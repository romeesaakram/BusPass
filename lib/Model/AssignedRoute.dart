class AssignedRoute {
  int? RouteId;
  String? RouteTitle;
  List<stops>? Stops;

  AssignedRoute({this.RouteId, this.RouteTitle, this.Stops});

  AssignedRoute.fromJson(Map<String, dynamic> json) {
    RouteId = json['RouteId'];
    RouteTitle = json['RouteTitle'];
    if (json['Stops'] != null) {
      Stops = <stops>[];
      json['Stops'].forEach((v) {
        Stops!.add(new stops.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['RouteId'] = this.RouteId;
    data['RouteTitle'] = this.RouteTitle;
    if (this.Stops != null) {
      data['Stops'] = this.Stops!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class stops {
  int? Id;
  String? Name;
  String? Timing;
  String? Longitude;
  String? Latitude;
  int? Route;

  stops(
      {this.Id,
      this.Name,
      this.Timing,
      this.Longitude,
      this.Latitude,
      this.Route});

  stops.fromJson(Map<String, dynamic> json) {
    Id = json['Id'];
    Name = json['Name'];
    Timing = json['Timing'];
    Longitude = json['Longitude'];
    Latitude = json['Latitude'];
    Route = json['Route'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.Id;
    data['Name'] = this.Name;
    data['Timing'] = this.Timing;
    data['Longitude'] = this.Longitude;
    data['Latitude'] = this.Latitude;
    data['Route'] = this.Route;
    return data;
  }
}