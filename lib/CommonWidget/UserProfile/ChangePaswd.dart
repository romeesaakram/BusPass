import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fyp_project/controller/AuthController.dart';
import 'package:provider/provider.dart';

import 'ProfileScreen.dart';

class ChangePswd extends StatefulWidget {
  const ChangePswd({super.key});

  @override
  State<ChangePswd> createState() => _ChangePswdState();
}

class _ChangePswdState extends State<ChangePswd> {
  TextEditingController oldpass = TextEditingController();
  TextEditingController newpass = TextEditingController();

  TextEditingController cfrmpass = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade400,
        centerTitle: true,
        title: const Text('Change Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 350,
                      height: 400,
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
                              'assets/images/Vector.png',
                              fit: BoxFit
                                  .contain, // Adjust fit to your requirement
                              width: 100, // Adjust width as needed
                              height: 150, // Adjust height as needed
                            ),

                            const SizedBox(width: 40),
                            SizedBox(
                              width: 300,
                              // decoration: BoxDecoration(
                              //
                              //   border: Border.all(
                              //     color: Colors.black26,
                              //     width: 1.0,
                              //   ),
                              //  ),
                              child: Column(
                                children: [
                                  TextFormField(
                                    validator: (value) {
                                      if (value == null || value == '') {
                                        return 'Please enter old password';
                                      }
                                      return null;
                                    },
                                    cursorColor: Colors.white,
                                    controller: oldpass,
                                    style: const TextStyle(color: Colors.white),
                                    decoration: const InputDecoration(
                                      hintText: 'Old Password',
                                      hintStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              14, // Set the font size of the hint text
                                          fontStyle: FontStyle.italic),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    cursorColor: Colors.white,
                                    controller: newpass,
                                    validator: (value) {
                                      if (value == null || value == '') {
                                        return 'Please enter new password';
                                      }
                                      return null;
                                    },
                                    style: const TextStyle(color: Colors.white),
                                    decoration: const InputDecoration(
                                      hintText: 'New Password',
                                      hintStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              14, // Set the font size of the hint text
                                          fontStyle: FontStyle.italic),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    validator: (value) {
                                      if (value == null || value == '') {
                                        return 'Please confirm your password';
                                      }
                                      if (newpass.text != cfrmpass.text) {
                                        return 'new and confirm password must match.';
                                      }
                                      return null;
                                    },
                                    cursorColor: Colors.white,
                                    controller: cfrmpass,
                                    style: const TextStyle(color: Colors.white),
                                    decoration: const InputDecoration(
                                      hintText: 'Confirm Password',
                                      hintStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize:
                                              14, // Set the font size of the hint text
                                          fontStyle: FontStyle.italic),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // ],
                            //),
                          ]),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          Provider.of<AuthController>(context, listen: false)
                              .changePassword(
                                  newPassword: newpass.text,
                                  oldPassword: oldpass.text);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        fixedSize: const Size(400, 50), // Set background color
                      ),
                      child: Text(
                        ' CONFIRM',
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
        ),
      ),
    );
  }
}
