import 'package:flutter/material.dart';
import 'package:fyp_project/Organization/Home.dart';
import 'package:fyp_project/Organization/Map.dart';
import 'package:fyp_project/Organization/Profile.dart';

class Organizationdashbord extends StatefulWidget {
  const Organizationdashbord({super.key});

  @override
  State<Organizationdashbord> createState() => _OrganizationdashbordState();
}

class _OrganizationdashbordState extends State<Organizationdashbord> {
  int selected_Index = 0;
  List<Widget> screen = [
   orgHome(),
    orgMap(),
    //NotificationScreen(),flutter 
    orgProfile(),
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
