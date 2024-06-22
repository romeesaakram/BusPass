import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class orgMap extends StatefulWidget {
  const orgMap({super.key});

  @override
  State<orgMap> createState() => _orgMapState();
}

class _orgMapState extends State<orgMap> {
final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(33.64378939723715, 73.07760113599646),
    zoom: 14.0,
  );

  final List<Marker> _markers = <Marker>[];

  @override
  void initState() {
    super.initState();
    _loadMarkers();
  }

  Future<void> _loadMarkers() async {
    final BitmapDescriptor marker1 = await _createMarkerImageFromAsset('assets/images/Biit.png');
    final BitmapDescriptor marker2 = await _createMarkerImageFromAsset('assets/images/Biit.png');
    final BitmapDescriptor marker3 = await _createMarkerImageFromAsset('assets/images/Biit.png');

    setState(() {
      _markers.addAll([
        Marker(
          markerId:  MarkerId('marker1'),
          position:  LatLng(33.64238510505734,  73.07472826264673),
          icon: marker1,
          infoWindow:  InfoWindow(title: 'Marker 1'),
        ),
        Marker(
          markerId:  MarkerId('marker2'),
          position:  LatLng(33.628349984074106, 73.06766186304908,),
          icon: marker2,
          infoWindow:  InfoWindow(title: 'Marker 2'),
        ),
        Marker(
          markerId:  MarkerId('marker3'),
          position:  LatLng(33.65914685826683, 73.09131162602111,),
          icon: marker3,
          infoWindow:  InfoWindow(title: 'Marker 3'),
        ),
      ]);
    });
  }
 

  Future<BitmapDescriptor> _createMarkerImageFromAsset(String assetPath) async {
    final ImageConfiguration imageConfiguration = createLocalImageConfiguration(context);
    return BitmapDescriptor.fromAssetImage(imageConfiguration, assetPath);
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
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}