class ChildLocation {
  String? Name;
  List<location>? Location;

  ChildLocation({this.Name, this.Location});

  ChildLocation.fromJson(Map<String, dynamic> json) {
    Name = json['Name'];
    if (json['Location'] != null) {
      Location = <location>[];
      json['Location'].forEach((v) {
        Location!.add(new location.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.Name;
    if (this.Location != null) {
      data['Location'] = this.Location!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class location {
  double? latitude;
  double? longitude;

  location({this.latitude, this.longitude});

  location.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}