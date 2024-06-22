import 'dart:async';

import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fyp_project/ApiHandler/DistanceCalculator.dart';
import 'package:fyp_project/Model/AssignedRoute.dart';
import 'package:fyp_project/Model/StopModel.dart';
import 'package:fyp_project/Model/UpdatebusLocationInsert.dart';
import 'package:fyp_project/Parent/ParentProfile.dart';
import 'package:fyp_project/controller/AuthController.dart';
import 'package:fyp_project/controller/ConductorController.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class ConductorMapScreen extends StatefulWidget {
  const ConductorMapScreen({super.key});

  @override
  State<ConductorMapScreen> createState() => _ConductorMapScreenState();
}
class Route {
  double latitude;
  double longitude;
  String? name;
  int? stopRoute;
  String? time;

  Route({
    required this.latitude,
    required this.longitude,
    this.name,
    this.stopRoute,
    this.time,
  });
}
class _ConductorMapScreenState extends State<ConductorMapScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  final CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();
  String? _visibleMarkerId;
  String? _selectedJourney;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(33.64378939723715, 73.07760113599646),
    zoom: 14.0, // Adjust zoom level as needed
  );

  final List<Marker> _markers = [];
  final List<LatLng> _polylineCoordinates = [];
  BitmapDescriptor? _currentLocationIcon;
  @override
  void initState() {
    super.initState();
    // Call a function to add markers
    _setCustomMarkerIcon();
    _addMarkers();

    _getCurrentLocation();
  }

  void _setCustomMarkerIcon() async {
    _currentLocationIcon =
        await _createCustomMarkerFromAsset('assets/images/bus.png');
  }
  
  late LatLng initialPosition;

  void _getCurrentLocation() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    Marker currentLocationMarker = Marker(
      markerId: const MarkerId('currentLocation'),
      position: LatLng(position.latitude, position.longitude),
      infoWindow: const InfoWindow(title: 'Current Location'),
      icon: _currentLocationIcon ??
          BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      draggable: true, // Make the marker draggable
      onDragEnd: (newPosition) {
          // Update the position of the marker when dragged
          setState(() {
            initialPosition = LatLng(position.latitude, position.longitude);

            initialPosition = newPosition;
                  updateBusData(newPosition);

          });
        },

    );
    setState(() {
      _markers.add(currentLocationMarker);
    });

    GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newLatLngZoom(
      LatLng(position.latitude, position.longitude),
      14.0,
    ));
  }
  
  int count = 0;
    void ReachatStop({required  busId,required  routeId,required  stopId}  ) async {
     
   conductorController = Provider.of<ConductorController>(context, listen: false);
     conductorController.ReachAtStop(busId, routeId, stopId);
    }

    
  void updateBusData(LatLng newPosition) async {
     Cords cords = Cords(
                  latitude: newPosition.latitude,
                  longitude: newPosition.longitude,
                );

                 print('Bus ID: ${AuthController.conductorData.first.BusId}');
                print('Route ID: ${filterid}');
               print('Route Latitude  ${newPosition.latitude}');
                  print('Route Longitude  ${newPosition.longitude}');



                BusLocationInsert busLocation = BusLocationInsert(
                  busId: AuthController.conductorData.first.BusId,
                  routeId: filterid,
                  cords: cords,
                );
                for (var markers in filterRoute)
                {
              double distanceInKm = distance(newPosition.latitude, newPosition.longitude, markers.latitude, markers.longitude);
              if(distanceInKm < 20)
                {
                  print("Reached at strop");
                  count += 1;
                 print('Reach at strop: $count');
                 ReachatStop(busId:  AuthController.conductorData.first.BusId, routeId: filterid, stopId: filterRoute.first.stopRoute);

                }

           //   print('Distance between Stop and Bus: $distanceInKm km');
                   
                  
               
                }
              
              //see stop marker

  ConductorController conductorController = Provider.of<ConductorController>(context, listen: false);
  //BusLocationInsert bus = BusLocationInsert(BusLocationInsert);
  conductorController.updateBusLocation(busLocation);
}
   List<AssignedRoute> assignedRoute = [];
List<Route> filterRoute = [];
  final List<Marker> _markers2 = [];

   int filterid = 0;

   final List<String> _categories = []; // Initialize an empty list


  late ConductorController conductorController;
  // Function to add markers
   void _showCustomInfoWindow(Route route) {
    // Example of showing custom content (Container with text) in the info window
    _customInfoWindowController.addInfoWindow!(
          Container(
                width: 220,
                height: 210,
                decoration: BoxDecoration(
                  color: Colors.teal.shade500,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 12,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Text(
                          route.name?? '',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 50,
                      left: 10,
                      right: 10,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: 110,
                              height: 115,
                              decoration: BoxDecoration(
                                color: Colors.teal.shade800,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/images/Stop.png',
                                    width: 50,
                                    height: 50,
                                  ),
                                  const SizedBox(height: 5),
                                  const Text(
                                    'Route No',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    route.stopRoute.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 110,
                              height: 115,
                              decoration: BoxDecoration(
                                color: Colors.teal.shade800,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/images/BusStop.png',
                                    width: 70,
                                    height: 60,
                                  ),
                                  const SizedBox(height: 1),
                                  const Text(
                                    'Stop Timing',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    route.time.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ]),
                    ),
                   
                  ],
                ),
              ),
                    LatLng(route.latitude, route.longitude), // Position where the info window should be anchored
    );
  }

  
void StopInfoWindow() {
  for (var route in filterRoute) {
    _markers.add(Marker(
      markerId: MarkerId(route.latitude.toString()),
      position: LatLng(route.latitude, route.longitude),
      onTap: () {
        _showCustomInfoWindow(route);
    
      },
      infoWindow: InfoWindow(
        
      ),
    ));
  }
}


  void _addMarkers() async {
  WidgetsBinding.instance.addPostFrameCallback((_) async {
      final conductorController =
          Provider.of<ConductorController>(context, listen: false);
      await conductorController.AssignedRoutes();
  for (var routeList in conductorController.allAssignedRoute) {
    
          assignedRoute.add(routeList);
                    print("Title");

          print(routeList.RouteTitle);
            _categories.addAll(conductorController.allAssignedRoute.map((route) => route.RouteTitle!));


    }

    });
    
   
  }

  Future<BitmapDescriptor> _createCustomMarkerFromAsset(
      String assetName) async {
    final ByteData byteData = await rootBundle.load(assetName);
    final Uint8List imageData = byteData.buffer.asUint8List();
    return BitmapDescriptor.fromBytes(imageData);
  }

  void _updatePolyline() {
    if (_markers.isEmpty) return;

    // Clear previous coordinates
    _polylineCoordinates.clear();

    // Adding marker positions to polyline coordinates
    for (final marker in _markers) {
      _polylineCoordinates.add(marker.position);
    }

    // Add the start position (first marker) to the end of the polyline to complete the loop
    _polylineCoordinates.add(_polylineCoordinates.first);

    // Update UI
    setState(() {});
  }
  String _selectedCategory = '';
  void _showJourneyDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Choose Your Journey'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              DropdownButton<String>(
                value: _selectedCategory.isEmpty ? null : _selectedCategory,
                hint: Text('Select Route'),
                onChanged: (String? value) {
                  setState(() {
                    _selectedCategory = value!;
                    print(_selectedCategory);
                  });
                },
                items: _categories
                    .map((String category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                })
                    .toList(),
              ),
               SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () async {
               ConductorController conductorController = Provider.of<ConductorController>(context, listen: false);
          for (var route in assignedRoute) {
               
                  
            
             if (route.RouteTitle == _selectedCategory)
             {
              //Here
             conductorController.startJourney(route.RouteId?? 0); // Replace 0 with a default value
              filterid = route.RouteId ?? 0;
              ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(
          content: Text('Journey started successfully with route title: ${route.RouteTitle}'),
           ),  );
                             print('ID to filterRoute: Lat=$filterid');

            if(route.RouteId == filterid)
                {
                  
                 for (var stop in route.Stops!) {
                  double lat = double.parse(stop.Latitude!);
                  print('Adding stop to filterRoute: Lat=$lat');
                      filterRoute.add(Route(
                      latitude: double.parse(stop.Latitude!), 
                longitude: double.parse(stop.Longitude!),
                name: stop.Name,
                time: stop.Timing,
                stopRoute: stop.Route,
                  ));
                  
                    }
                }
            
     // _updatePolyline(); // <--- Add this line
    setState(() {
StopInfoWindow();
_updatePolyline();
    });
                        
                            }

            }

                      Navigator.of(context).pop();
                      // Add additional functionality here if needed
                    },
                    child: const Text('Start'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      // Add functionality to proceed with the selected journey
                    },
                    child: const Text('Close'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade400,
        title: const Text('Map'),
      ),
      body: Stack(children: [
        GoogleMap(
          initialCameraPosition: _kGooglePlex,
          mapType: MapType.normal,
          markers: Set<Marker>.of(_markers),
          onTap: (position) {
            _customInfoWindowController.hideInfoWindow!();
            setState(() {
              _visibleMarkerId = null;
            });
          },
          onCameraMove: (position) {
            _customInfoWindowController.onCameraMove!();
          },
          polylines: {
            Polyline(
              polylineId: const PolylineId('polyline'),
              points: _polylineCoordinates,
              color: Colors.red,
              width: 3,
            ),
          },
          onMapCreated: (GoogleMapController controller) {
            _customInfoWindowController.googleMapController = controller;
            _controller.complete(controller);
          },
        ),
        CustomInfoWindow(
          controller: _customInfoWindowController,
          height: 210,
          width: 260,
          offset: 45,
        ),
        Positioned(
          bottom: 50,
          right: 30,
          left: 30,
          child: Center(
            child: ElevatedButton(
              onPressed: _showJourneyDialog,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                minimumSize: const Size(200, 40), // Set background color
              ),
              child: Text(
                'CHOOSE JOURNEY',
                style: TextStyle(
                  color: Colors.teal.shade800, // Set text color
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
