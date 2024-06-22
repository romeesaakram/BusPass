import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fyp_project/ApiHandler/apihandler.dart';
import 'package:fyp_project/Model/ScanQR.dart';
import 'package:fyp_project/Parent/ParentProfile.dart';
import 'package:fyp_project/controller/AuthController.dart';
import 'package:fyp_project/controller/ConductorController.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'QRVerificationScreen.dart';

import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

// class ConductorQRScreen extends StatefulWidget {
//   const ConductorQRScreen({super.key});

//   @override
//   State<ConductorQRScreen> createState() => _ConductorQRScreenState();
// }

// class _ConductorQRScreenState extends State<ConductorQRScreen> {

//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   Barcode? result;
//   QRViewController? controller;
 
//   bool isControllerInitialized = false;
//  late ConductorController conductorController;
//  var scannedString="";
//  late int scannedPassId;

//   void _onQRViewCreated(QRViewController controller) {
//     this.controller = controller;
//     controller.scannedDataStream.listen((scanData) {
//       setState(() {
//         result = scanData;
//       });
//     });
//   }

//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
 
//   @override
//     void initState() {
//     super.initState();
//     // Call a function to add markers
//    // _QrApi(passid: 2, bussId: 1);
   
//   }
//    bool checkqr=false;
//   Future<bool> _QrApi({required int passid, required int bussId} ) async {
//     // print("Student name: ${AuthController.studentData.first.Name}");
//    conductorController = Provider.of<ConductorController>(context, listen: false);
//     //await  conductorController.scanQr(passid: authController.std!.PassId,bussId:AuthController.conductorData.first.Id);
//     await  conductorController.scanQr(passid:passid ,bussId:bussId);
//     checkqr=conductorController.checkqr;
//     print("QrCheck:$checkqr");
//     return true;

//    }
  
//   @override
//   Widget build(BuildContext context) {
//     isCalled = false;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.teal.shade400,
//         title: const Text('QR Code Scanner'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(0.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: Image.asset('assets/images/Logo.png'),
//             ),

//             Center(
//               child: Container(
//                 width: 295,
//                 height: 280,
//                 decoration: BoxDecoration(
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.2),
//                       blurRadius: 20.0,
//                       spreadRadius: 5.0,
//                     ),
//                   ],
//                   border: Border.all(
//                     color: Colors.black26,
//                     width: 1.0,
//                   ),
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//                 child: Stack(
//                   children: [
//                     _buildQrView(context),
//                     if (isControllerInitialized)
//                       Align(
//                         alignment: Alignment.bottomCenter,
//                         child: TextButton(
//                           onPressed: () {
//                             controller.toggleFlash();
//                           },
//                           child: FutureBuilder(
//                             future: controller.getFlashStatus(),
//                             builder: (context, snapshot) {
//                               return Text(
//                                 'Flash: ${snapshot.data?.toString() == 'true' ? 'ON' : 'OFF'}',
//                                 style: const TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 20.0,
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                       ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildQrView(BuildContext context) {
//     return QRView(
//       key: qrKey,
//       onQRViewCreated: _onQRViewCreated,
//       overlay: QrScannerOverlayShape(
//         borderColor: Colors.grey,
//         borderRadius: 10,
//         borderLength: 20,
//         borderWidth: 10,
//         cutOutSize: 300,
//       ),
//     );
//   }

//   // bool isCalled = false;
//   // void _onQRViewCreated(QRViewController controller) async {
//   //   this.controller = controller;
//   //   isControllerInitialized = true; // Mark controller as initialized
//   //   controller.scannedDataStream.listen((scanData) async {
//   //     // Process the scanned data
     
//   //     //  bool isScanCompleted=false;
     
//   //    if (!isCalled) {
//   //     // isCalled = true;
        
//   //        print('Scanned Data: ${scannedString}');
//   //         scannedString = scanData.code ?? '';
//   //         setState(() {
       
//   //               scannedPassId = int.tryParse(scannedString)!;
//   //              // isScanCompleted=true; 

//   //             // _QrApi(passid: (scannedPassId), bussId: AuthController.conductorData.first.BusId);

//   //             // checkqr=true;

//   //               // if(checkqr==true)
//   //               //   {
//   //               //     Navigator.push(
//   //               //         context,
//   //               //         MaterialPageRoute(builder: (context) => const QRVerification()),
//   //               //       );
//   //               //     print("valid QR");
//   //               //   }
        
//   //     });

     
        
//   //    }
      
//   //     // if (scannedPassId != null) {
//   //     //      print('Scanned pass id: ${scannedPassId}');
//   //     //    await  _QrApi(passid: scannedPassId, bussId: AuthController.conductorData.first.BusId);
//   //     //      print('Check QR : $checkqr');
//   //     //      print('Bus id: ${AuthController.conductorData.first.BusId}');
//   //     // if(checkqr==true)
//   //     // {
//   //     //    Navigator.push(
//   //     //       context,
//   //     //       MaterialPageRoute(builder: (context) => const QRVerification()),
//   //     //     );
//   //     //   print("valid QR");
//   //     // }
            
//   //     // }

//   //       // Check if the scanned string matches the expected value
//   //       if(isScanCompleted == true)
//   //       {
//   //          _QrApi(passid: (scannedPassId), bussId: AuthController.conductorData.first.BusId);
//   //          isCalled=false;
          
//   //           Navigator.push(
//   //           context,
//   //           MaterialPageRoute(builder: (context) => const QRVerification()),
//   //         );
        
//   //       print("valid QR");

      



//   //       }
       
//   //        else {
//   //         // Show error message
//   //         showDialog(
//   //           context: context,
//   //           builder: (BuildContext context) {
//   //             return AlertDialog(
//   //               title: const Text('Error'),
//   //               content: const Text('Invalid QR Code!'),
//   //               actions: <Widget>[
//   //                 TextButton(
//   //                   onPressed: () {
//   //                     Navigator.of(context).pop(); // Close the dialog
//   //                     //isCalled = false; // Reset isCalled to allow further scanning
//   //                   },
//   //                   child: const Text('OK'),
//   //                 ),
//   //               ],
//   //             );
//   //           },
//   //         );
//   //       }
      
      
//   //   }
//   //   );
//   //        _QrApi(passid: (scannedPassId), bussId: AuthController.conductorData.first.BusId);
         

//   // }

// }






class QRViewExample extends StatefulWidget {
  const QRViewExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  String? passid;
    late ConductorController conductorController;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
 
  }
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  if (result != null)
                    Text(
                        'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                  else
                    const Text('Scan a code'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                            onPressed: () async {
                              await controller?.toggleFlash();
                              setState(() {});
                            },
                            child: FutureBuilder(
                              future: controller?.getFlashStatus(),
                              builder: (context, snapshot) {
                                return Text('Flash: ${snapshot.data}');
                              },
                            )),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: ElevatedButton(
                            onPressed: () async {
                              await controller?.flipCamera();
                              setState(() {});
                            },
                            child: FutureBuilder(
                              future: controller?.getCameraInfo(),
                              builder: (context, snapshot) {
                                if (snapshot.data != null) {
                                  return Text(
                                      'Camera facing ${describeEnum(snapshot.data!)}');
                                } else {
                                  return const Text('loading');
                                }
                              },
                            )),
                      )
                    ],
                  ),
             
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) async {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) async {
      setState(() {
        result = scanData;
        if(result!=null)
        {
           passid=result!.code;
           print('QrCode pass id $passid');
           
           
        }


       
      });
    });
         
            await  scanQrApi(passid:passid! ,bussId: AuthController.conductorData.first.BusId);
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  //   Future<bool> scanQr ({required String passid, required int bussId}) async {
  
  //     //print('PId:${AuthController.pid}');
  
  // print(passid);
  // print(bussId);
     
  //     var res = await Dio().get(
  //      '${APIHandler().base_url}Conductor/ScanQrCode?passId=$passid&busId=$bussId}');
  //      http://localhost/WebApi/api/Conductor/ScanQrCode?passId=2&busId=1
  //     // 'http://192.168.230.143/WebApi/api/Conductor/ScanQrCode?passId=2&busId=1');
  //     log('*************************************************');
  //     log(res.data.toString());
  //   log(res.statusCode.toString());
  //      log('*************************************************');

  //     if (res.statusCode == 200) {


  //      print(res.data.toString());

  //     return true;
  //   } 
  //   return false;



   
  // }

  scanQrApi(
      {required String passid, required int bussId}) async {
    print("${passid.toString()}");
    print(bussId);

    final response = await http.get(
      Uri.parse('${APIHandler().base_url}Conductor/ScanQrCode?passId=$passid&busId=$bussId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
    
      },
    );
    log('********************************************************************');
    log(response.statusCode.toString());
    log(response.body);
    var data = jsonDecode(response.body.toString());



    if (response.statusCode == 200) {
     final QrScan  qr= QrScan.fromJson(data);
     
    Get.to(QRVerification(), arguments:qr );
    }

   // return Event.fromJson(data);
  }
}