import 'package:flutter/material.dart';
import 'package:fyp_project/Admin/AddBusScreen.dart';
import 'package:fyp_project/Admin/AddStudentScreen.dart';
import 'package:fyp_project/Admin/AdddAdminScreen.dart';
import 'package:fyp_project/Admin/RechargeJourneysScreen.dart';
import 'package:fyp_project/Admin/SearchUpdateScreen.dart';
class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(   appBar: AppBar(
      backgroundColor: Colors.teal.shade400,
      title: Text('Add'),
        ),
        body: Padding(
        padding: const EdgeInsets.all(55.0),
        child: Center(
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AddStudentScreen()),
                          );
                        },
                        child: Container(
                          width: 100,
                          height: 100,
                          color: Colors.white,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Text(
                                'ADD NEW \nSTUDENT',
                                style: TextStyle(
                                  color: Colors.teal.shade800,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AddAdminScreen()),
                          );
                        },
                        child: Container(
                          width: 100,
                          height: 100,
                          color: Colors.white,
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Text(
                              'ADD NEW  \n  ADMIN',
                              style: TextStyle(
                                color: Colors.teal.shade800,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AddBusScreen()),
                          );
                        },
                        child: Container(
                          width: 100,
                          height: 100,
                          color: Colors.white,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Text(
                                'ADD NEW\n    BUS',
                                style: TextStyle(
                                  color: Colors.teal.shade800,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RechargeJourneysScreen()),
                          );
                        },
                        child: Container(
                          width: 100,
                          height: 100,
                          color: Colors.white,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Text(
                                'RECHARGE  JOURNEYS',
                                style: TextStyle(
                                  color: Colors.teal.shade800,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 40),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SearchUpdateScreen()),
                          );
                        },
                        child: Container(
                          width: 100,
                          height: 100,
                          color: Colors.white,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Text(
                                'SEARCH & \n UPDATE',
                                style: TextStyle(
                                  color: Colors.teal.shade800,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
