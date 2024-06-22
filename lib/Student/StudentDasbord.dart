import 'package:flutter/material.dart';
import 'package:fyp_project/Model/UserModel.dart';
import 'package:fyp_project/Student/StudentScreen.dart';
import 'MapScreen.dart';
import '../CommonWidget/Notifications/NotificationScreen.dart';
import '../CommonWidget/UserProfile/ProfileScreen.dart';
import 'QRScreen.dart';

class StdDashbord extends StatefulWidget {
  final Student student;

   StdDashbord({Key? key, required this.student}) : super(key: key);
   
     

  @override
  State<StdDashbord> createState() => _StdDashbordState();
}

class _StdDashbordState extends State<StdDashbord> {
  int selected_Index = 0;
  late List<Widget> screen;

  @override
  void initState() {
    super.initState();
    screen = [
      StudentScreen(student: widget.student),
       MapScreen(student: widget.student),
       QRScreen(student: widget.student),
       NotificationScreen(student: widget.student),
      ProfileScreen(student: widget.student),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // Print the student object for testing
    print(widget.student);

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
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.teal.shade500,
            icon: const Icon(
              Icons.arrow_circle_right_outlined,
              color: Colors.white,
            ),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.teal.shade500,
            icon: const Icon(
              Icons.qr_code,
              color: Colors.white,
            ),
            label: 'QR Code',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.teal.shade500,
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.teal.shade500,
            icon: const Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: 'Profile',
          ),
        ],
      ),
      body: screen[selected_Index],
    );
  }
}

