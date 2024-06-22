import 'dart:async';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AdminMapScreen extends StatefulWidget {
  const AdminMapScreen({Key? key}) : super(key: key);

  @override
  State<AdminMapScreen> createState() => _AdminMapScreenState();
}

class _AdminMapScreenState extends State<AdminMapScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  final CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

        TextEditingController stopcontroller = TextEditingController();
          TextEditingController routecontroller = TextEditingController();
           List<String> selectedOptions = []; // List to store selected options
  List<String> options = ['Option 1', 'Option 2', 'Option 3']; // Example options

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(33.64378939723715, 73.07760113599646),
    zoom: 14.0,
  );

  final List<Marker> _markers = [];
  final List<LatLng> _polylineCoordinates = [];
  String? _visibleMarkerId;
  LatLng? _tapPosition;

  @override
  void initState() {
    super.initState();
    _addMarkers();
  }

  void _addMarkers() async {
    List<Map<String, dynamic>> markerData = [
      {
        "id": "1",
        "latitude": 33.64238510505734,
        "longitude": 73.07472826264673,
        "title": "Rehman abad",
        "timing": "8:30 am"
      },
      {
        "id": "2",
        "latitude": 33.628349984074106,
        "longitude": 73.06766186304908,
        "title": "6 road",
        "timing": "9:00 am"
      },
      {
        "id": "3",
        "latitude": 33.65914685826683,
        "longitude": 73.09131162602111,
        "title": "bus",
        "timing": "9:30 am",
        "customImage": "assets/images/bus.png"
      },
      {
        "id": "4",
        "latitude": 33.63248641818264,
        "longitude": 73.08345600470636,
        "title": "Shamsabad",
        "timing": "10:00 am"
      },
      {
        "id": "5",
        "latitude": 33.63963332204927,
        "longitude": 73.0943596456569,
        "title": "Murree Road",
        "timing": "10:30 am"
      },
      {
        "id": "6",
        "latitude": 33.64333029418348,
        "longitude": 73.07875205042022,
        "title": "Biit",
        "timing": "11:00 am",
        "customImage": "assets/images/biit.png"
      },
    ];

    for (var data in markerData) {
      Marker marker = Marker(
        markerId: MarkerId(data["id"]),
        position: LatLng(data["latitude"], data["longitude"]),
        onTap: () {
          if (_visibleMarkerId == data["id"]) {
            _customInfoWindowController.hideInfoWindow!();
            setState(() {
              _visibleMarkerId = null;
            });
          } else {
            _customInfoWindowController.addInfoWindow!(
              Container(
                width: 220,
                height: 150,
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
                          data["title"],
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
                                  data["id"],
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
                                  data["timing"],
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              LatLng(data["latitude"], data["longitude"]),
            );
            setState(() {
              _visibleMarkerId = data["id"];
            });
          }
        },
      );

      if (data["customImage"] != null) {
        _createCustomMarkerFromAsset(data["customImage"]!).then((BitmapDescriptor customIcon) {
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
  }

  Future<BitmapDescriptor> _createCustomMarkerFromAsset(String assetName) async {
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

  // Function to show Add New Stop dialog
  void _showAddNewStopDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Stop Details'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
                controller: stopcontroller,
              decoration: InputDecoration(
                hintText: 'Enter Stop name',
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Handle save action for new stop
                Navigator.pop(context); // Close dialog
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }

  // Function to show Add New Route dialog
  void _showAddNewRouteDialog() {
showDialog(
  context: context,
  builder: (context) => StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) {
      // State variables
      List<String> allStops = ['Stop 1', 'Stop 2', 'Stop 3']; // Replace with actual stop names
      List<String> selectedStops = [];
     
      return AlertDialog(
        title: Text('Route Details',
         style: TextStyle(fontWeight: FontWeight.bold,
                     color: Colors.teal.shade800),),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Text field for route name
            TextField(
              controller: routecontroller,
              decoration: InputDecoration(
                hintText: 'Enter Route name',
              ),
            ),
            SizedBox(height: 10),
            // List of checkboxes for stops
            Container(
               decoration: BoxDecoration(
    border: Border.all(color: Colors.black), // Border color
    borderRadius: BorderRadius.circular(5), // Optional: Border radius
  ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: allStops.length,
                itemBuilder: (context, index) {
                  String stopName = allStops[index];
                  bool isSelected = selectedStops.contains(stopName);
              
                  return CheckboxListTile(
                    title: Text(stopName),
                    value: isSelected,
                    onChanged: (bool? value) {
                      setState(() {
                        if (value != null && value) {
                          selectedStops.add(stopName);
                        } else {
                          selectedStops.remove(stopName);
                        }
                      });
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            // Container to display selected stops
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selected Stops:'
                    ,
                    
                    style: TextStyle(fontWeight: FontWeight.bold,
                     color: Colors.teal.shade800),
                  ),
                  SizedBox(height: 5),
                  Wrap(
                    spacing: 5,
                    children: selectedStops
                        .map((stop) => Chip(label: Text(stop)))
                        .toList(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Handle save action for new route
                String routeName = routecontroller.text.trim();
                // For demonstration, just print selected stops and route name
                print('Route Name: $routeName');
                print('Selected Stops: $selectedStops');
                Navigator.pop(context); // Close dialog
              },
              child: Text('Add'),
            ),
          ],
        ),
      );
    },
  ),
);

  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade400,
        title: const Text('Map'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _kGooglePlex,
            mapType: MapType.normal,
            markers: Set<Marker>.of(_markers),
            onTap: (position) {
              _customInfoWindowController.hideInfoWindow!();
              setState(() {
                _visibleMarkerId = null;
                _tapPosition = position;
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
          if (_tapPosition != null)
            Positioned(
              left: _tapPosition!.latitude,
              top: _tapPosition!.longitude,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _tapPosition = null;
                  });
                },
                child: Container(
                  width: 200,
                  height: 170,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        spreadRadius: 1,
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          // Handle "Add New Stop" action
                          setState(() {
                            _tapPosition = null; // Close the container
                            _showAddNewStopDialog();
                          });
                        },
                        child: Text(
                            'Add New Stop',
                            style: TextStyle(
                              color: Colors.teal.shade800, // Replace with your desired color
                              // You can also specify other properties such as fontSize, fontWeight, etc.
                            ),
                          ),
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: () {
                          // Handle "Add New Route" action
                          setState(() {
                            _tapPosition = null; // Close the container
                            _showAddNewRouteDialog();
                          });
                        },
                        child: Text(
                            'Add New Route',
                            style: TextStyle(
                              color: Colors.teal.shade800, // Replace with your desired color
                              // You can also specify other properties such as fontSize, fontWeight, etc.
                            ),
                          ),
                      ),
                      const SizedBox(height: 10),
                       ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _tapPosition = null; // Close the container
                          });
                        },
                        child: Text(
                            'Close',
                            style: TextStyle(
                              color: Colors.teal.shade800, // Replace with your desired color
                              // You can also specify other properties such as fontSize, fontWeight, etc.
                            ),
                          ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          CustomInfoWindow(
            controller: _customInfoWindowController,
            height: 280,
            width: 260,
            offset: 45,
          ),
        ],
      ),
    );
  }
}
