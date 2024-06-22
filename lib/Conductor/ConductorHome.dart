import 'package:flutter/material.dart';
import 'package:fyp_project/Parent/ParentProfile.dart';
import 'package:fyp_project/controller/AuthController.dart';
import 'package:fyp_project/controller/ConductorController.dart';
import 'package:provider/provider.dart';

import 'ConductorAnnoucement.dart';

class ConductorHome extends StatefulWidget {
  const ConductorHome({super.key});

  @override
  State<ConductorHome> createState() => _ConductorHomeState();
}

class _ConductorHomeState extends State<ConductorHome> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   
    
      WidgetsBinding.instance.addPostFrameCallback((_) {
         seats();
    });
  }
  
  int BookSeatsount = 0;
   late ConductorController conductorController;
   void seats() async {
  conductorController = Provider.of<ConductorController>(context, listen: false);
  await conductorController.BookSeats();
  await conductorController.getNextStop(AuthController.conductorData.first.Id);
    String? StopName=conductorController.nextstop.first.Name;
   print("Stop name: $StopName");

  print("Bus data updated");
  BookSeatsount = conductorController.value;

 
}

   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade400,
        title:  Text('Home',
         style: TextStyle(
                  color: Colors.white,
                                                        // fontSize: 12, // Adjust the font size as needed
                 fontWeight:
                  FontWeight.bold,
            ),
        
      ),),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 350,
              height: 120,
              child: Align(
                alignment: Alignment.topCenter,
                child: Stack(
                  children: <Widget>[
                    SizedBox(
                      width: 110,
                      height: 110,
                      child: CircularProgressIndicator(
                        strokeWidth: 7.0,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.teal.shade300),
                        value:
                            0.7, // You can change this value according to your progress
                      ),
                    ),
                     Positioned.fill(
                      child: Center(
                        child: Text(
                          '${BookSeatsount.toString()}% \n seats Booked',
                          
                          // Change this text according to your progress
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Stack(
                children: <Widget>[
                  Column(
                    children: [
                      Container(
                        width: 300,
                        height: 230,
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
                        child: Stack(
                          children: [
                             Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: EdgeInsets.only(top: 10.0),
                                child: Text(
                                  'Next Stop',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 45, // Adjust top position as needed
                              left: 0,
                              right: 0,
                              child: Center(
                                child: Container(
                                  width:
                                      280, // Set the width of the second container
                                  height:
                                      170, // Set the height of the second container
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                       Align(
                                        alignment: Alignment.topCenter,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top:
                                                  10.0), // Adjust top padding as needed
                                          child: Text(
                                            '6 Road',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 50,
                                        left: 10,
                                        right: 10,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Container(
                                                width: 116,
                                                height: 115,
                                                decoration: BoxDecoration(
                                                  color: Colors.teal.shade700,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Image.asset(
                                                      'assets/images/BusStop.png',
                                                      width:
                                                          80, // Adjust width as needed
                                                      height:
                                                          60, // Adjust height as needed
                                                    ),
                                                    //SizedBox(height: 5), // Adjust the spacing between image and text
                                                    const Text(
                                                      'Stop Timing',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        // fontSize: 12, // Adjust the font size as needed
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 5),
                                                    const Text(
                                                      '8:00 AM',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        // fontSize: 12, // Adjust the font size as needed
                                                        // fontWeight: FontWeight.bold,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: 116,
                                                height: 115,
                                                decoration: BoxDecoration(
                                                  color: Colors.teal.shade700,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  // half of width and height for a perfect circle
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Image.asset(
                                                      'assets/images/Stop.png',
                                                      width:
                                                          70, // Adjust width as needed
                                                      height:
                                                          50, // Adjust height as needed
                                                    ), // Adjust color as needed
                                                    const SizedBox(
                                                        height:
                                                            1), // Adjust the spacing between image and text
                                                     Text(
                                                      'Route No',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        // fontSize: 12, // Adjust the font size as needed
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 5),
                                                     Text(
                                                      '1',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        // fontSize: 12, // Adjust the font size as needed
                                                        // fontWeight: FontWeight.bold,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ]),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      ///Second Container Code
                      const SizedBox(
                        height: 8,
                      ),

                      Container(
                        width: 300,
                        height: 205,
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
                        child: Stack(
                          children: [
                             Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: EdgeInsets.only(top: 10.0),
                                child: Text(
                                  'Journey Details',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 45, // Adjust top position as needed
                              left: 0,
                              right: 0,
                              child: Center(
                                child: Container(
                                  width:
                                      280, // Set the width of the second container
                                  height:
                                      155, // Set the height of the second container
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 65,
                              left: 20,
                              right: 20,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      width: 116,
                                      height: 115,
                                      decoration: BoxDecoration(
                                        color: Colors.teal.shade700,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Image.asset(
                                            'assets/images/BusStop.png',
                                            width: 80, // Adjust width as needed
                                            height:
                                                60, // Adjust height as needed
                                          ),
                                          //SizedBox(height: 5), // Adjust the spacing between image and text
                                          const Text(
                                            'Total Stop',
                                            style: TextStyle(
                                              color: Colors.white,
                                              // fontSize: 12, // Adjust the font size as needed
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                           Text(
                                            '5',
                                            style: TextStyle(
                                              color: Colors.white,
                                              // fontSize: 12, // Adjust the font size as needed
                                              // fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 116,
                                      height: 115,
                                      decoration: BoxDecoration(
                                        color: Colors.teal.shade700,
                                        borderRadius: BorderRadius.circular(10),
                                        // half of width and height for a perfect circle
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Image.asset(
                                            'assets/images/BusStop.png',
                                            width: 70, // Adjust width as needed
                                            height:
                                                50, // Adjust height as needed
                                          ), // Adjust color as needed
                                          const SizedBox(
                                              height:
                                                  1), // Adjust the spacing between image and text
                                          const Text(
                                            'Remaining Stop',
                                            style: TextStyle(
                                              color: Colors.white,
                                              // fontSize: 12, // Adjust the font size as needed
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          const Text(
                                            '2',
                                            style: TextStyle(
                                              color: Colors.white,
                                              // fontSize: 12, // Adjust the font size as needed
                                              // fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
