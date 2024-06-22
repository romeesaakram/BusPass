import 'package:flutter/material.dart';
import 'package:fyp_project/Model/UserModel.dart';
import 'package:fyp_project/controller/AuthController.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:provider/provider.dart';
class QRScreen extends StatefulWidget {
  const QRScreen({super.key, required Student student});

  @override
  State<QRScreen> createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
    late AuthController authController;
    // final String qrData = "2020-arid-3759";
   
  @override
  Widget build(BuildContext context) {
   authController = Provider.of<AuthController>(context, listen: false);
    //final String qrData = authController.std!.RegNo;
    final String qrData = authController.std!.PassId.toString();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade400,
        title: Text('QR Code'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          child:  Column(
            children: [
              Center(
                child: Image.asset('assets/images/AccountCircle.png'),
              ),
              Center(

                child: Text(
                   '${authController.std!.Name.toString()} \nPass Id:${authController.std!.PassId.toString()}',
                     
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
             SizedBox(height: 60,),
             Container(
                  width: 295, // Set the width of the container to 300 pixels
                  height: 300, // Set the height of the container to 300 pixels
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2), // Set shadow color
                        blurRadius: 20.0, // Set blur radius
                        spreadRadius: 5.0, // Set spread radius
                      ),
                    ],
                    border: Border.all(
                      color: Colors.black26,
                      width: 1.0,
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0), // Set border radius
                  ),// Change the color of the container to blue
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        PrettyQr(
                          size: 240,
                          data: qrData,
                          roundEdges: true,
                        //  elementColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),

            ],
          ),



        ),
      ),


    );
  }
}
