import 'package:flutter/material.dart';
import 'package:fyp_project/Admin/MapScreen.dart';
import 'package:fyp_project/Model/UserModel.dart';

import 'AddScreen.dart';
import 'AdminNotification.dart';
import 'AdminProfile.dart';
import 'AdmoinHomeScreen.dart';
class AdminDashbord extends StatefulWidget {
  const AdminDashbord({super.key, required Admin admin});

  @override
  State<AdminDashbord> createState() => _AdminDashbordState();
}

class _AdminDashbordState extends State<AdminDashbord> {
  int selected_Index=0;
  List<Widget> screen=[
    AdminHome(),
    AdminMapScreen(),
    AddScreen(),
    AdminNotification(),
    AdminProfil(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(

        currentIndex: selected_Index,
        onTap: (int index){
          setState(() {
            selected_Index=index;
          });
        },
        backgroundColor: Colors.teal.shade400,

        items: [
          BottomNavigationBarItem(
              backgroundColor: Colors.teal.shade500,
              icon: Icon(Icons.home,color: Colors.white,),
              label: 'Home'

          ),
          BottomNavigationBarItem(
              backgroundColor: Colors.teal.shade500,
              icon: Icon(Icons.arrow_circle_right_outlined,color: Colors.white,),
              label: 'Map'
          ),
          BottomNavigationBarItem(
              backgroundColor: Colors.teal.shade500,
              icon: Icon(Icons.add_circle_outline ,color:Colors.white,),
              label: 'Add'
          ),
          BottomNavigationBarItem(
              backgroundColor: Colors.teal.shade500,
              icon: Icon(Icons.notifications_active,color: Colors.white,),
              label: 'Notification'
          ),
          BottomNavigationBarItem(
              backgroundColor: Colors.teal.shade500,
              icon: Icon(Icons.person,color: Colors.white,),
              label: 'Profile'
          ),
        ],
      ),
      body:screen[selected_Index],
    );
  }
}
