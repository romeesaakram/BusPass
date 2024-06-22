  import 'dart:convert';
  import 'package:dio/dio.dart';
  import 'package:flutter/material.dart';
  import 'package:flutter_easyloading/flutter_easyloading.dart';
  import 'package:fyp_project/Admin/AdminDashbord.dart';
  import 'package:fyp_project/ApiHandler/apihandler.dart';
  import 'package:fyp_project/Conductor/ConductorDashbord.dart';
  import 'package:fyp_project/Model/Notification.dart';
  import 'package:fyp_project/Model/UserModel.dart';
  import 'package:fyp_project/Parent/parentDashbord.dart';
  import 'package:fyp_project/Student/StudentDasbord.dart';
  import 'package:get/get.dart';
  import 'package:provider/provider.dart';

  class AuthController extends ChangeNotifier {
    String? loggedInUserRole;
    List<NotificationData> notifications = [];
    User? loggedInUser;
    Student? std;
    Parent? parent;
    Conductor? con;
    Admin? admin;
    static int pid = 0;
    int LoginID = 0;
    static int ConductorID = 0;
 // static final AuthController instance = AuthController();
static List<Conductor> conductorData = [];
static List<Student> studentData = [];
     static int? BusId;
    
    loginUser({required String username, required String password}) async {
      try {
  // EasyLoading.show();
    var response = await APIHandler().login(password: password, username: username);

    if (response.statusCode == 200) {
      // Deserialize the JSON response
      var data = response.data;
      User loggedInUser = User.fromJson(data);
      print("testing print");
      print(loggedInUser);
      print(response);

      switch (loggedInUser.userRole.toLowerCase()) {
        case 'student':
         std = loggedInUser.students;
        // Student s=new Student(Id: std!.Id, Name: std!.Name, Gender: std!.Gender, RegNo: std!.RegNo, Contact: std!.Contact, UserName: std!.UserName, Password: std!.Password, PassStatus: std!.PassStatus, PassExpiry: std!.PassExpiry, TotalJourneys: std!.TotalJourneys, RemainingJourneys: std!.RemainingJourneys, ParentId: std!.ParentId, UserId: std!.UserId, PassId: std!.PassId);
        //  studentData.add(s);

        // loggedInUser.students.Id
          Get.offAll(() => StdDashbord(student: std!));
          break;
        case 'admin':
          admin = loggedInUser.admins;
          Get.offAll(() => AdminDashbord(admin: admin!));
          break;
        case 'parent':
          parent = loggedInUser.parents;
          pid = loggedInUser.parents.Id;
          Get.offAll(() => ParentDashbord(parent: parent!));
          break;
        case 'conductor':
          con = loggedInUser.conductors;

          BusId = con!.BusId;
          Conductor c = new Conductor(Id: con!.Id, Name:con!.Name, Contact: con!.Contact, UserId: con!.UserId, UserName: con!.UserName, Password: con!.Password, BusId: con!.BusId, BusRegNo: con!.BusRegNo, TotalSeats: con!.TotalSeats);
          conductorData?.add(c);
         


        
          print("Conductor ID: ${conductorData.first.BusId}");

          Get.offAll(() => ConductorDashbord(conductor: con!));
          break;
        default:
          print('Unknown user role: ${loggedInUser.userRole}');
      }
    }
  // EasyLoading.dismiss();
  } catch (e) {
  //  EasyLoading.dismiss();
    print("There is an error: $e");
  }

    }
    bool isLoading = false;
    Future<void> getNotifications() async {
      try {
        if(  loggedInUser!.students.Id!=null)
        {
          LoginID  =  loggedInUser!.students.Id;
        print('Login ID: ${LoginID}');

        }
        print("API Url");
        print('${APIHandler().base_url}Users/GetUserNotification?id=${LoginID}');

        isLoading = true;
        notifications = [];
        notifyListeners();
        var res = await Dio().get(
          // '${APIHandler().base_url}Users/GetUserNotification?id=${LoginID}');
          'http://192.168.230.143/WebApi/api/Users/GetUserNotification?id=3');
        if (res.statusCode == 200) {
          if (res.data['status']) {
            for (var element in res.data['data']) {
              notifications.add(NotificationData.fromJson(element));
            }
          }
        }
      } catch (e) {
        // Handle error appropriately
        print("Error getting notifications: $e");
      } finally {
        isLoading = false;
        notifyListeners();
      }
    }

    Future<void> changePassword({required String oldPassword, required String newPassword}) async {
      try {
        var response = await Dio().put(
            '${APIHandler().base_url}Users/ChangePassword',
            data: jsonEncode({
              'id': APIHandler.loggedInUserId,
              'oldPassword': oldPassword,
              'newPassword': newPassword
            }));
        EasyLoading.showToast(response.data);
        Get.back();
      } catch (e) {
        // Handle error appropriately
        print("Error changing password: $e");
      }
    }

    // For conductor only
    void updateConductorLocation(double latitude, double longitude) {
      try {
        Dio().post('${APIHandler().base_url}Conductor/updateConductor',
            data: jsonEncode({
              'latitude': latitude.toString(),
              'longitude': longitude.toString(),
              'id': APIHandler.loggedInUserId
            }));
      } catch (e) {
        // Handle error appropriately
        print("Error updating conductor location: $e");
      }
    }
  }