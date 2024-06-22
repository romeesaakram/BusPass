import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fyp_project/ApiHandler/apihandler.dart';
import 'package:fyp_project/Model/AllChildsHistoryModel.dart';
import 'package:fyp_project/Model/ChildrenModel.dart';
import 'package:fyp_project/Model/History.dart';
import 'package:fyp_project/Model/ParentChildLocation.dart';
import 'package:fyp_project/controller/AuthController.dart';

class Historycontroller extends ChangeNotifier {
  List<HistoryModel> histories = [];
  List<ChildrenModel> childrens = [];
  List<Allchildshistorymodel> allChildrensHistory = [];
  List<ChildLocation> getchildLocation = [];


  bool isLoadingHistory = false;
  getStudentHistory({required int studentId}) async {
    try {
      isLoadingHistory = true;
      histories = [];
      notifyListeners();
      var res = await Dio().get(
          '${APIHandler().base_url}Parent/getChildrenHistory?studentId=$studentId');
      if (res.statusCode == 200) {
        for (var element in res.data) {
          histories.add(HistoryModel.fromMap(element));
        }
      }
    } catch (e) {}
    isLoadingHistory = false;
    notifyListeners();
  }

  bool isLoadingChildrens = false;

  getChildrens() async {
    try {
      print('PId:${AuthController.pid}');
      isLoadingChildrens = true;
      childrens = [];
      notifyListeners();
      print(  '${APIHandler().base_url}Parent/GetChildren?id=${AuthController.pid}');
      var res = await Dio().get(
          '${APIHandler().base_url}Parent/GetChildren?id=${AuthController.pid}');
      if (res.statusCode == 200) {
        print(200);
        for (var element in res.data) {
          childrens.add(ChildrenModel.fromJson(element));
        
        }
      }
    } catch (e) {}
    isLoadingChildrens = false;

    notifyListeners();
   
  }

  getChildLocation() async {
    try {
      print('PId:${AuthController.pid}');
      isLoadingChildrens = true;
      getchildLocation = [];
      notifyListeners();
      var res = await Dio().get(
          '${APIHandler().base_url}Parent/GetChildLocation?id=${AuthController.pid}');
      if (res.statusCode == 200) {
        for (var element in res.data) {
          getchildLocation.add(ChildLocation.fromJson(element));
        }
      }
    } catch (e) {}
    isLoadingChildrens = false;

    notifyListeners();
   
  }


  getAllChildrenHistory() async {
    try {
      isLoadingHistory = true;
      notifyListeners();
      var res = await Dio().get(
          '${APIHandler().base_url}Parent/getAllChildrenDetail?parentId=${APIHandler.loggedInUserId}');
      if (res.statusCode == 200) {
       // allChildrensHistory.clear();
        for (var element in res.data) {
          getchildLocation.add(ChildLocation.fromJson(element));
        }
      }
    } catch (e) {
      print(e);
    }

    isLoadingHistory = false;
    notifyListeners();
  }











void fetchChildrenData() async {
  var res = await Dio().get('${APIHandler().base_url}Parent/GetChildren?id=${AuthController.pid}');
  
  if (res.statusCode == 200) {
    List<ChildrenModel> childrens = []; // List to store ChildrenModel objects
    
    // Iterate through each element in res.data and convert to ChildrenModel
    for (var element in res.data) {
      ChildrenModel child = ChildrenModel.fromJson(element);
      childrens.add(child);
    }
    
    // Now childrens list contains all ChildrenModel objects parsed from API response
    // You can use childrens list as needed
    print(childrens); // Example of what you can do with childrens list
  } else {
    // Handle API error
    print('Failed to fetch children data');
  }
}
}