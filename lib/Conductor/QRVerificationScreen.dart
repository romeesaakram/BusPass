import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fyp_project/Model/ScanQR.dart';
import 'package:get/get.dart';

class QRVerification extends StatefulWidget {



   QRVerification({super.key,});

  @override
  State<QRVerification> createState() => _QRVerificationState();
}

class _QRVerificationState extends State<QRVerification> {
    QrScan? qr;
var arguments=Get.arguments;

  @override
  Widget build(BuildContext context) {
    qr=arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade400,
        title: const Text('Student Verified'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: 350,
                  height: 470,
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/Satisfy.png',
                        fit: BoxFit.contain, // Adjust fit to your requirement
                        width: 100, // Adjust width as needed
                        height: 100, // Adjust height as needed
                      ),
                      const SizedBox(width: 10), // Space between image and text
                      const Text(
                        'Student Verify',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10), // Space between image and text
                      const Text(
                        'Pass Status: Valid',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Column(
                            children: [
                              Text(
                                'Std Name',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                qr!.Name.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 40,
                            width: 1,
                            //color: Colors.white, // Ensure this contrasts with container's background
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                          ),
                          const Column(
                            children: [
                              Text(
                                'Reg No',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                ' 20-arid-3759',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      const Column(
                        children: [
                          Divider(
                            color: Colors.white,
                            thickness: 1.0,
                            indent: 60,
                            endIndent: 50,
                            height: 0.1,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Column(
                            children: [
                              Text(
                                ' Journey ',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                ' 25  ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 40,
                            width: 1,

                            color: Colors
                                .white, // Ensure this contrasts with container's background
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                          ),
                          const Column(
                            children: [
                              Text(
                                'Gender',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Female',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      const Column(
                        children: [
                          Divider(
                            color: Colors.white,
                            thickness: 1.0,
                            indent: 60,
                            endIndent: 50,
                            height: 0.1,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Column(
                            children: [
                              Text(
                                '  PassID ',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                ' 1500  ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 40,
                            width: 1,

                            color: Colors
                                .white, // Ensure this contrasts with container's background
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                          ),
                          const Column(
                            children: [
                              Text(
                                'Pass exp',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '112',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
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
            ]),
      ),
    );
  }
}
