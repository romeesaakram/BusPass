import 'package:flutter/material.dart';
import 'package:fyp_project/CommonWidget/HistoryScreen.dart';
import 'package:fyp_project/controller/AuthController.dart';
import 'package:provider/provider.dart';

import '../CommonWidget/UserProfile/ChangePaswd.dart';
import '../LoginScreen.dart';

class ParentProfile extends StatefulWidget {
   ParentProfile({super.key});

  @override
  State<ParentProfile> createState() => _ParentProfileState();
}
  late AuthController authController;

class _ParentProfileState extends State<ParentProfile> {
  @override
  Widget build(BuildContext context) {
      authController = Provider.of<AuthController>(context, listen: false);
     return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade400,
        title:  const Text('Profile'),
      ),
      body: Padding(
        padding:  const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 350,
                height: 350,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 20.0,
                      spreadRadius: 5.0,
                    ),
                  ],
                  border: Border.all(
                    color: Colors.black26,
                    width: 1.0,
                  ),
                  color: Colors.teal.shade500,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/AccountCircle.png',
                      fit: BoxFit.contain,
                      width: 100,
                      height: 100,
                    ),
                     const SizedBox(
                        height: 10), // Space between image and text
                    Text(
                      authController.parent!.Name,
                      style:  const TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                     const SizedBox(height: 10), // Space between text and grid
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            // Add grid content here
                            Container(
                              padding:  const EdgeInsets.all(8.0),
                              decoration:  const BoxDecoration(
                                border: Border(
                                  bottom:
                                      BorderSide(width: 1.0, color: Colors.white),
                                  right:
                                      BorderSide(width: 1.0, color: Colors.white),
                                ),
                              ),
                              child: Column(
                                children: [
                                   const Text('Contact',
                                      style: TextStyle(color: Colors.white)),
                                   const SizedBox(
                                      width:
                                          10), // Adjust spacing between the texts
                                  Text(
                                    authController.parent!.Contact,
                                    style:  const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding:  const EdgeInsets.all(8.0),
                              decoration:  const BoxDecoration(
                                border: Border(
                                  right:
                                      BorderSide(width: 1.0, color: Colors.white),
                                ),
                              ),
                              child: Column(
                                children: [
                                   const Text('PID',
                                      style: TextStyle(color: Colors.white)),
                                   const SizedBox(
                                      width:
                                          10), // Adjust spacing between the texts
                                  Text(
                                    authController.parent!.Id.toString(),
                                    style:  const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            // Add grid content here
                            Container(
                              padding:  const EdgeInsets.all(8.0),
                              decoration:const BoxDecoration(
                                border: Border(
                                  bottom:
                                      BorderSide(width: 1.0, color: Colors.white),
                                ),
                              ),
                              child: Column(
                                children: [
                                  const Text('Children Enroll',
                                      style: TextStyle(color: Colors.white)),
                                   const SizedBox(
                                      width:
                                          10), // Adjust spacing between the texts
                                  Text(
                                    authController.parent!.ChildrenEnroll.toString(),
                                    style:  const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding:  const EdgeInsets.all(8.0),
                              decoration:  const BoxDecoration(),
                              child: Column(
                                children: [
                                   const Text('User Name',
                                      style: TextStyle(color: Colors.white)),
                                   const SizedBox(
                                      width:
                                          10), // Adjust spacing between the texts
                                  Text(
                                    authController.parent!.UserName,
                                    style:  const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
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
               const SizedBox(
                height: 10,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>  const HistoryScreen()),
                    ); // Add your button onPressed functionality here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    fixedSize:  const Size(400, 50), // Set background color
                  ),
                  child: Text(
                    ' HISTORY',
                    style: TextStyle(
                      color: Colors.teal.shade800, // Set text color
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
               const SizedBox(
                height: 10,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>  const ChangePswd()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    fixedSize:  const Size(400, 50), // Set background color
                  ),
                  child: Text(
                    'CHANGE PASSWORD',
                    style: TextStyle(
                      color: Colors.teal.shade800, // Set text color
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
               const SizedBox(
                height: 10,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>  const loginScreen()),
                    ); // Add your button onPressed functionality here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    fixedSize:  const Size(400, 50), // Set background color
                  ),
                  child: Text(
                    ' LOG OUT',
                    style: TextStyle(
                      color: Colors.teal.shade800, // Set text color
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
