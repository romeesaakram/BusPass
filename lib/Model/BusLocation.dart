class BusesLocation {
  int? BusId;
  int? RouteId;
  String? RouteTitle;
  Cord? Cords;

  BusesLocation({this.BusId, this.RouteId, this.RouteTitle, this.Cords});

  BusesLocation.fromJson(Map<String, dynamic> json) {
    BusId = json['BusId'];
    RouteId = json['RouteId'];
    RouteTitle = json['RouteTitle'];
    Cords = json['Cords'] != null ? Cord.fromJson(json['Cords']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['BusId'] = BusId;
    data['RouteId'] = RouteId;
    data['RouteTitle'] = RouteTitle;
    if (Cords != null) {
      data['Cords'] = Cords!.toJson();
    }
    return data;
  }
}

class Cord {
  double? latitude;
  double? longitude;

  Cord({this.latitude, this.longitude});

  Cord.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}
