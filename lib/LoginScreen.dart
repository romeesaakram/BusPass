import 'package:flutter/material.dart';
import 'package:fyp_project/controller/AuthController.dart';
import 'package:provider/provider.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController pswdController = TextEditingController();
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Image.asset(
                  'assets/images/images.png', // Replace this with your background image path
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.topCenter,
                  height: 350,
                  fit: BoxFit.fitHeight,
                ),
                // Add another image on top of the background image

                Image.asset(
                  'assets/images/Logo.png',
                  // Replace this with your overlay image path
                  width: 330,
                  height: 330,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 30),

                // Text positioned on top of the logo image
                const Positioned(
                  top:
                      210, // Adjust the top position according to your requirement
                  child: Text(
                    'Bus Pass With QR Scan',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 250,
              height: 200,
              // decoration: BoxDecoration(
              //   border: Border.all(
              //     color: Colors.black26,
              //     width: 1.0,
              //   ),
              //
              // ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    cursorColor: Colors.white,
                    controller: nameController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: 'User Name',
                      hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 14, // Set the font size of the hint text
                          fontStyle: FontStyle.italic),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    cursorColor: Colors.white,
                    controller: pswdController,
                    obscureText: _isObscure,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 14, // Set the font size of the hint text
                        fontStyle: FontStyle.italic,
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                      child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.teal.shade800,
                      backgroundColor: Colors.white, // Change the text color
                      minimumSize: const Size(150,
                          50), // Set the minimum size (width, height) of the button
                    ),
                    onPressed: () async {
                      try {
                        await Provider.of<AuthController>(context, listen: false).loginUser(
                          username: nameController.text,
                          password: pswdController.text,
                        );
                      } catch (e) {
                        print("Error during login button press: $e");
                      }
                    },

                      // Print status code for debugging
                      // print(response.statusCode);

                      // // Handle different status codes
                      // if (response.statusCode == 204) {
                      //   showDialog(
                      //     context: context,
                      //     builder: (context) {
                      //       return const AlertDialog(
                      //         title: Text('Invalid email or password'),
                      //       );
                      //     },
                      //   );
                      // } else if (response.statusCode == 200) {
                      //   dynamic obj = jsonDecode(response.body);
                      //   print(obj);

                      //   // Initialize UserId variable
                      //   int? userId;

                      //   // Check each key for UserId and assign accordingly
                      //   if (obj['Students'] != null &&
                      //       obj['Students']['UserId'] != null) {
                      //     userId = obj['Students']['UserId'];
                      //   } else if (obj['Parents'] != null &&
                      //       obj['Parents']['UserId'] != null) {
                      //     userId = obj['Parents']['UserId'];
                      //   } else if (obj['Conductors'] != null &&
                      //       obj['Conductors']['UserId'] != null) {
                      //     userId = obj['Conductors']['UserId'];
                      //   } else if (obj['Admins'] != null &&
                      //       obj['Admins']['UserId'] != null) {
                      //     userId = obj['Admins']['UserId'];
                      //   }

                      //   // Print the UserId
                      //   print('UserId: $userId');

                      //   // Navigate based on userId using if-else
                      //   if (userId == 1) {
                      //     Navigator.of(context).pushReplacement(
                      //       MaterialPageRoute(
                      //           builder: (context) => const StdDashbord()),
                      //     );
                      //   } else if (userId == 2) {
                      //     Navigator.of(context).pushReplacement(
                      //       MaterialPageRoute(
                      //           builder: (context) =>
                      //               const ConductorDashbord()),
                      //     );
                      //   } else if (userId == 3) {
                      //     Navigator.of(context).pushReplacement(
                      //       MaterialPageRoute(
                      //           builder: (context) => const ParentDashbord()),
                      //     );
                      //   } else if (userId == 4) {
                      //     Navigator.of(context).pushReplacement(
                      //       MaterialPageRoute(
                      //           builder: (context) => const AdminDashbord()),
                      //     );
                      //   } else {
                      //     // Handle unknown UserId case if needed
                      //     print('Unknown UserId: $userId');
                      //   }
                      // } else {
                      //   // Show an error if status code is not 200 or 204
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     const SnackBar(
                      //       content: Text('Error: Text does not match'),
                      //     ),
                      //   );
                      // }
                    
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.teal.shade800,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
