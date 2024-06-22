import 'dart:async';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fyp_project/Model/BusLocation.dart';
import 'package:fyp_project/Model/BussModel.dart';
import 'package:fyp_project/Model/RouteInfoModel.dart';
import 'package:fyp_project/Model/UserModel.dart';
import 'package:fyp_project/controller/AuthController.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../controller/StopsController.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key, required Student student});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  final CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();
  String? _visibleMarkerId;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(33.64378939723715, 73.07760113599646),
    zoom: 14.0,
  );

  final List<Marker> _markers = [];
  final List<LatLng> _polylineCoordinates = [];
  List<BusesLocation> busList = [];

  @override
  void initState() {
    super.initState();
    _addMarkers();
     BusMarkerTimer();
  }

  late StudentStopsController studentStopsController;
  void BusMarkerTimer()
  {
    Timer.periodic(const Duration(seconds: 2), (timer) { 
    updateBusData();

    });

     Timer.periodic(const Duration(seconds: 2), (timer) { 
      updateMarkers();
  });
  }
 
void updateMarkers() async {
  // Clear previous markers
 // _markers.clear();
     // busList.clear()
  for (var items in busList) {
    print("Bus: ${items.Cords?.latitude}, ${items.Cords?.longitude}");

    Marker busMarker = Marker(
      markerId: MarkerId(items.BusId.toString()),
      position: LatLng(items.Cords?.latitude ?? 0.0, items.Cords?.longitude ?? 0.0), 
      icon: await _createCustomMarkerFromAsset('assets/images/bus.png'), 
      infoWindow: InfoWindow(
        title: 'Bus Location',
        snippet: 'Bus is here',
      ),
    );

    _markers.add(busMarker);
  }

  // Assuming you have a method to update the map
  setState(() {
    // Update your map here if necessary
  });

  print("Bus markers updated");
}

  
 void handleTime() {  

}
/*
void AddBusMarker() async {
  
  studentStopsController =
        Provider.of<StudentStopsController>(context, listen: false);
    await studentStopsController.getBus();
    print("Bus Marker Updated");

     for (var b in studentStopsController.allbuses) {
      print("ID");
            print(b.BusId);

      busList.add(b);
    }

}*/
void updateBusData() async {
  studentStopsController = Provider.of<StudentStopsController>(context, listen: false);
  await studentStopsController.getBus();
  print("Bus data updated");

  busList.clear();
  for (var b in studentStopsController.allbuses) {
    print("ID: ${b.BusId}");
    busList.add(b);
  }
}
  void _addMarkers() async {
    studentStopsController =
        Provider.of<StudentStopsController>(context, listen: false);
    await studentStopsController.getAllRoute();


    // Flatten the nested list structure
    List<RouteInfoModel> flatList = [];
    for (var routeList in studentStopsController.allroute) {
      flatList.addAll(routeList);
    }
    


    for (RouteInfoModel data in flatList) {
      Marker marker = Marker(
        markerId: MarkerId(data.Id.toString()),
        position: LatLng(double.parse(data.Latitude ?? '0'),
            double.parse(data.Longitude ?? '0')),
        onTap: () {
          if (_visibleMarkerId == data.Id.toString()) {
            _customInfoWindowController.hideInfoWindow!();
            setState(() {
              _visibleMarkerId = null;
            });
          } else {
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
                          data.Name ?? '',
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
                                    data.Id.toString(),
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
                                    data.Timing.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ]),
                    ),
                    Positioned(
                      bottom: 55,
                      left: 0,
                      right: 0,
                      child: Center(
                        // child: ElevatedButton(
                        //   onPressed: () {
                        //     studentStopsController(
                        //         stop_id: data.id ?? 0, index: i);
                        //   },
                        //   style: ElevatedButton.styleFrom(
                        //     backgroundColor:
                        //         Colors.white, // Set background color
                        //   ),
                        //   child: Text(
                        //     ' ADD TO FAVOURITE STOPS',
                        //     style: TextStyle(
                        //       color: Colors.teal.shade800, // Set text color
                        //       fontSize: 15,
                        //       fontWeight: FontWeight.bold,
                        //     ),
                        //   ),
                        // ),
                      ),
                    ),
                    Positioned(
                      top: 220,
                      left: 0,
                      right: 0,
                      child: Center(
                        // child: ElevatedButton(
                        //   onPressed: () {
                        //     studentStopsController.deletefavoutiteStop(
                        //         stop_id: data.Id ?? 0, index: i);
                        //   },
                        //   style: ElevatedButton.styleFrom(
                        //     backgroundColor:
                        //         Colors.white, // Set background color
                        //   ),
                        //   child: Text(
                        //     ' REMOVE FAVOURITE STOPS',
                        //     style: TextStyle(
                        //       color: Colors.teal.shade800, // Set text color
                        //       fontSize: 15,
                        //       fontWeight: FontWeight.bold,
                        //     ),
                        //   ),
                        // ),
                      ),
                    ),
                  ],
                ),
              ),
              LatLng(double.parse(data.Latitude ?? '0'),
                  double.parse(data.Longitude ?? '0')),
            );
            setState(() {
              _visibleMarkerId = data.Id.toString();
            });
          }
        },
      );

      if (data == flatList.last) {
        _createCustomMarkerFromAsset("assets/images/Biit.png")
            .then((BitmapDescriptor customIcon) {
          marker = marker.copyWith(
            iconParam: customIcon,
          );
          _markers.add(marker);
          setState(() {
            _updatePolyline();
          });
        });
      } else {
        _markers.add(marker);
        setState(() {
          _updatePolyline();
        });
      }
    }

    /*
  for(var items in busList)
  {
        print("Bus");

    print( items.Cords?.latitude);
  Marker busMarker = Marker(
    markerId: MarkerId(items.BusId.toString()),
    position: LatLng(items.Cords?.latitude ?? 0.0, items.Cords?.longitude ?? 0.0), 
    icon: await _createCustomMarkerFromAsset('assets/images/BusMarker.png'), 
    infoWindow: InfoWindow(
      title: 'Bus Location',
      snippet: 'Bus is here',
    ),
  );
  _markers.add(busMarker);
}*/
   
    setState(() {
      _updatePolyline();
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

    _polylineCoordinates.clear();

    for (final marker in _markers) {
      _polylineCoordinates.add(marker.position);
    }

    _polylineCoordinates.add(_polylineCoordinates.first);

    setState(() {});
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
            print('Latitude: ${position.latitude}, Longitude: ${position.longitude}');
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
          height: 280,
          width: 260,
          offset: 45,
        )
      ]),
    );
  }
}
