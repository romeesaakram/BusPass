class BusLocationInsert {
  final int busId;
  final int routeId;
  final Cords cords;

  BusLocationInsert({
    required this.busId,
    required this.routeId,
    required this.cords,
  });

  // Convert the BusLocationInsert instance to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'BusId': busId,
      'RouteId': routeId,
      'Cords': cords.toJson(),
    };
  }
}

class Cords {
  final double latitude;
  final double longitude;

  Cords({
    required this.latitude,
    required this.longitude,
  });

  // Convert the Cords instance to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}