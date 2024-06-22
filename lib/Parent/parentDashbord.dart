import 'package:flutter/material.dart';
import 'package:fyp_project/CommonWidget/Notifications/NotificationScreen.dart';
import 'package:fyp_project/Model/UserModel.dart';
import 'package:fyp_project/Parent/ParentHome.dart';
import 'package:fyp_project/Parent/ParentMap.dart';
import 'package:fyp_project/Parent/ParentProfile.dart';

class ParentDashbord extends StatefulWidget {
  ParentDashbord({super.key, required Parent parent});

  @override
  State<ParentDashbord> createState() => _ParentDashbordState();
}

class _ParentDashbordState extends State<ParentDashbord> {
  int selected_Index = 0;
  List<Widget> screen = [
   ParentHome(),
    ParentMap(),
    //NotificationScreen(),
    ParentProfile(),
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
