import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fyp_project/Model/UserModel.dart';
import 'package:fyp_project/controller/AuthController.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import '../CommonWidget/Notifications/NotificationScreen.dart';
import 'ConductorHome.dart';
import 'ConductorMapScreen.dart';
import 'ConductorProfile.dart';
import 'ConductorQRScreen.dart';

class ConductorDashbord extends StatefulWidget {
  const ConductorDashbord({super.key, required Conductor conductor});

  @override
  State<ConductorDashbord> createState() => _ConductorDashbordState();
}

class _ConductorDashbordState extends State<ConductorDashbord> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startListening();
  }

  void startListening() {
    Geolocator.getPositionStream(
            locationSettings:
                AndroidSettings(intervalDuration: const Duration(seconds: 30)))
        .listen(
      (event) {
        Provider.of<AuthController>(context, listen: false)
            .updateConductorLocation(event.latitude, event.longitude);
      },
    );
  }

  int selected_Index = 0;
  List<Widget> screen = [
    const ConductorHome(),
    const ConductorMapScreen(),
    const QRViewExample(),
  // NotificationScreen(),
    const ConductorProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selected_Index,
        onTap: (int index) {
          setState(() {
            selected_Index = index;
          });
        },
        backgroundColor: Colors.teal.shade400,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Colors.teal.shade500,
              icon: const Icon(
                Icons.home,
                color: Colors.white,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              backgroundColor: Colors.teal.shade500,
              icon: const Icon(
                Icons.arrow_circle_right_outlined,
                color: Colors.white,
              ),
              label: 'Map'),
          BottomNavigationBarItem(
              backgroundColor: Colors.teal.shade500,
              icon: const Icon(
                Icons.qr_code_scanner,
                color: Colors.white,
              ),
              label: 'QR Scan'),
          BottomNavigationBarItem(
              backgroundColor: Colors.teal.shade500,
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
              ),
              label: 'Notification'),
          BottomNavigationBarItem(
              backgroundColor: Colors.teal.shade500,
              icon: const Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: 'Profile'),
        ],
      ),
      body: screen[selected_Index],
    );
  }
}
