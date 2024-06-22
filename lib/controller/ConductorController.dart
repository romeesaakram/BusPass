import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fyp_project/ApiHandler/apihandler.dart';
import 'package:fyp_project/Model/AssignedRoute.dart';
import 'package:fyp_project/Model/GetNextStop.dart';
import 'package:fyp_project/Model/ScanQR.dart';
import 'package:fyp_project/Model/StopModel.dart';
import 'package:fyp_project/Model/UpdatebusLocationInsert.dart';
import 'package:fyp_project/Model/UserModel.dart';
import 'package:fyp_project/controller/AuthController.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ConductorController extends ChangeNotifier {
  List<StopModel> stops = [];
  List<AssignedRoute> allAssignedRoute = [];
  List<QrScan> QR = [];
  List<NextStop> nextstop = [];
  
  // Future<bool> scanQrCode({required int passid, required int bussId}) async {
  //   try {
  //     var res = await Dio().get(
  //       //  '${APIHandler().base_url}Conductor/ScanQrCode?passId=$passid&busId=$bussId');
  //       'http://192.168.230.143/WebApi/api/Conductor/ScanQrCode?passId=2&busId=1');
  //     if (res.statusCode == 200) {
  //       return true;
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  //   return false;
  // }

  bool checkqr=false;
  Future<bool> scanQr ({required String passid, required int bussId}) async {
  
      //print('PId:${AuthController.pid}');
  
  print(passid);
  print(bussId);
     
      var res = await Dio().get(
       '${APIHandler().base_url}Conductor/ScanQrCode?passId=$passid&busId=$bussId}');
       http://localhost/WebApi/api/Conductor/ScanQrCode?passId=2&busId=1
      // 'http://192.168.230.143/WebApi/api/Conductor/ScanQrCode?passId=2&busId=1');
      log('*************************************************');
      log(res.data.toString());
    log(res.statusCode.toString());
       log('*************************************************');

      if (res.statusCode == 200) {


       print(res.data.toString());

      return true;
    } 
    return false;




   
  }

  


 startJourney(int routeId) async {
  print('StartJourney function called with routeId: $routeId');
  try {
    print('Getting Conductor instance from AuthController...');
    Conductor con = Provider.of<AuthController>(Get.context!, listen: false)
       .con!;
    print('Conductor instance: $con');
    print('BusId: ${con.BusId!}');
    print('RouteId: $routeId');
    print('Making POST request to ${APIHandler().base_url}Conductor/StartJourney...');
    var res = await Dio().post(
        '${APIHandler().base_url}Conductor/StartJourney?busId=${con.BusId!}&routeId=$routeId');
    print('Response: $res');
    print('StartJourney function completed successfully!');
  } catch (e) {
    print('Error in StartJourney function: $e');
  }
}
    bool isLoadingRoute= false;

  AssignedRoutes () async {
    try {
      //print('PId:${AuthController.pid}');
      isLoadingRoute = true;
      allAssignedRoute = [];
      notifyListeners();
      print('${APIHandler().base_url}Conductor/GetAssignedRoutes/?conductorId=${AuthController.conductorData.first.Id}');
      var res = await Dio().get(
       '${APIHandler().base_url}Conductor/GetAssignedRoutes/?conductorId=${AuthController.conductorData.first.Id}');
       //'http://192.168.230.143/WebApi/api/Conductor/GetAssignedRoutes/?conductorId=1');
      if (res.statusCode == 200) {
        for (var element in res.data) {
          allAssignedRoute.add(AssignedRoute.fromJson(element));
        }
      }
    } catch (e) {}
    isLoadingRoute = false;

    notifyListeners();
   
  }
  int value = 0;
   BookSeats() async {
    try {
      allAssignedRoute = [];
      notifyListeners();
      var res = await Dio().get(
         '${APIHandler().base_url}Conductor/GetBookedSeats/?conductorId=${AuthController.conductorData.first.Id}');
         // 'http://localhost/WebApi/api/Conductor/GetBookedSeats/?conductorId=1');
       //'http://192.168.230.143/WebApi/api/Conductor/GetAssignedRoutes/?conductorId=1');
         if (res.statusCode == 200) {
        var data = res.data; // This is the JSON response
       // final json = jsonDecode(data);
        int count = data;
      
        print('${count}% \n seats Booked check');
      }
    }
     catch (e) {

     }
    notifyListeners();
   
  }

 void updateBusLocation(BusLocationInsert bus) async {
  try {
    var response = await Dio().post(
      '${APIHandler().base_url}Conductor/UpdateBusLocation',
      data: jsonEncode(bus.toJson()),
    );
     if (response.statusCode == 200) {
      print("Bus location updated successfully!");
    } else {
      print("Error updating bus location: ${response.statusCode}");
    }
  } catch (e) {
    // Handle error appropriately
    print("Error updating conductor location: $e");
  }
}

 void ReachAtStop(int busId,int routeId,int stopId) async {
  try {
     var response = await Dio().post(
      '${APIHandler().base_url}Conductor/ReachedAtStop/?busId=$busId&routeId=$routeId&stopId=$stopId',
    );

    if (response.statusCode == 200) {
      // Success
      print("Conductor has successfully reached the stop.");
    }
  } catch (e) {
    // Handle error appropriately
    print("Error updating conductor location: $e");
  }
}

  Future<void> getNextStop(int id) async {
    try {
          final apiUrl = '${APIHandler().base_url}Conductor/GetNextStop/?conductorId=$id';

      var response = await Dio().get(
        apiUrl
      );
       print("API URL: $apiUrl");
        nextstop = [];
      //  print();
        print("Json: ${response.data}");
        for (var element in response.data) {
          print("Checkinnnnnnnnnnnnnng");
          nextstop.add(NextStop.fromJson(element));
                  print("Next stops data: ${jsonEncode(nextstop)}");
            
        }
     
    } catch (e) {
      print(e);
      // EasyLoading.showToast('An error occurred');
    } finally {
    
      notifyListeners();
    }
  }


}
