import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fyp_project/Model/ParentChildLocation.dart';
import 'package:fyp_project/controller/HistoryController.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class ParentMap extends StatefulWidget {
  @override
  State<ParentMap> createState() => _ParentMapState();
}

class _ParentMapState extends State<ParentMap> {
  final Completer<GoogleMapController> _controller = Completer();
  final List<Marker> _markers = [];
  final List<LatLng> _polylineCoordinates = [];
  BitmapDescriptor? _child1;
  BitmapDescriptor? _child2;
  BitmapDescriptor? _biit;
 List<ChildLocation> childList = [];


  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(33.64378939723715, 73.07760113599646),
    zoom: 14.0, // Adjust zoom level as needed
  );

  @override
  void initState() {
    super.initState();
    _createCustomMarkers();
   
     WidgetsBinding.instance.addPostFrameCallback((_) {
      _getchildrensLoc();
    });
   setState(() {
      // After fetching data, call updateMarkers
    });
    UpdateChilderMarkerTimer();

  }
  late Historycontroller historycontroller;
  void UpdateChilderMarkerTimer()
  {
    print("Rumi");
    Timer.periodic(const Duration(seconds: 2), (timer) { 
    _getchildrensLoc();

    });

  
  }
 Future<void> _getchildrensLoc() async {
    // Add your asynchronous code here

   historycontroller = Provider.of<Historycontroller>(context, listen: false);
   await historycontroller.getChildLocation();
   childList.clear();
for (var child in historycontroller.getchildLocation) {
      childList.add(child);
      print("Child Name :");

      print(child.Name);
    }

     updateMarkers();
     
  }

void updateMarkers() async {
  // Clear previous markers
 // _markers.clear();
  //busList.clear();
  print("Hi");
  for (var items in childList) {
               print("Item Location: ${items.Location?.last.latitude}");

    if (items.Location != null && items.Location!.isNotEmpty) {
      for (var loc in items.Location!) {
        print("Bus: ${loc.latitude}, ${loc.longitude}");
        
        Marker busMarker = Marker(
          markerId: MarkerId('${items.Name}'),
          position: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0), 
          icon: await _createCustomMarkerFromAsset('assets/images/Child.png'), 
          infoWindow: InfoWindow(
            title: items.Name,
          ),
        );

           setState(() {
            _markers.add(busMarker);
          });      }
    }
  }
}


  Future<void> _createCustomMarkers() async {
    //_child1 = await _createCustomMarkerFromAsset('assets/images/Child.png');
    // _child2 = await _createCustomMarkerFromAsset('assets/images/Child.png');
    _biit = await _createCustomMarkerFromAsset('assets/images/Biit.png');

    _addMarkers();
  }

  Future<BitmapDescriptor> _createCustomMarkerFromAsset(String assetName) async {
    final ByteData byteData = await rootBundle.load(assetName);
    final Uint8List imageData = byteData.buffer.asUint8List();
    return BitmapDescriptor.fromBytes(imageData);
  }

  void _addMarkers() {
    // Add first marker with custom image and title
   /* final marker1 = Marker(
      markerId: MarkerId('marker1'),
      position: LatLng(33.63881925690684, 73.08602964769176),
      infoWindow: InfoWindow(title: 'Romeesa Akram'),
      icon: _child1 ?? BitmapDescriptor.defaultMarker,
    );

    final marker2 = Marker(
      markerId: MarkerId('marker2'),
      position: LatLng(33.594860069965264, 73.0701793068512),
      infoWindow: InfoWindow(title: 'Hammad Akram'),
      icon: _child1 ?? BitmapDescriptor.defaultMarker,
    );
*/
    // Add second marker with custom image and title
    final marker3 = Marker(
      markerId: MarkerId('marker3'),
      position: LatLng(33.64327378892466, 73.07875925069355),
      infoWindow: InfoWindow(title: 'BIIT'),
      icon: _biit ?? BitmapDescriptor.defaultMarker,
    );

    setState(() {
     // _markers.add(marker1);
     // _markers.add(marker2);
        _markers.add(marker3);
      _updatePolyline();
    });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade400,
        title: const Text('Map'),
      ),
      body: GoogleMap(
        initialCameraPosition: _kGooglePlex,
        mapType: MapType.normal,
        markers: Set<Marker>.of(_markers),
        polylines: {
          Polyline(
            polylineId: const PolylineId('polyline'),
            points: _polylineCoordinates,
            color: Colors.red,
            width: 3,
          ),
        },
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}