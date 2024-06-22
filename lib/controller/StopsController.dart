import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fyp_project/ApiHandler/apihandler.dart';
import 'package:fyp_project/Model/BusLocation.dart';
import 'package:fyp_project/Model/BussModel.dart';
import 'package:fyp_project/Model/RouteInfoModel.dart';
import 'package:fyp_project/Model/StopInfoModel.dart';
import 'package:fyp_project/controller/AuthController.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class StudentStopsController extends ChangeNotifier {
  List<StopInfoModel> favouriteStops = [];
  List<StopInfoModel> allStops = [];
  List<List<RouteInfoModel>> allroute = [];
  List<BusesLocation> allbuses = [];

  bool isLoading = false;
  

  Future<void> addFavouriteStop({required int stop_id, required int index}) async {
    try {
      int stdId  = Provider.of<AuthController>(Get.context!, listen: false).std!.Id; 
      var response = await Dio().post(
        '${APIHandler().base_url}Student/AddFavStop?studentId=$stdId&stopId=$stop_id',
      
      );
      print("data add:${response}");

      if (response.statusCode == 200) {
        // Update the state of isFavourite
        allStops[index].isFavourite = true;
        favouriteStops.add(allStops[index]);
      } else {
        print("Error: ${response.statusCode} - ${response.data}");
      }
    } catch (e) {
      print("Exception: $e");
    }
    notifyListeners();
  }

  Future<void> deleteFavouriteStop({required int stop_id, required int index}) async {
    try {
      var response = await Dio().post(
        '${APIHandler().base_url}Student/DeleteFavStop', // Make sure you have the corresponding delete API endpoint
        data: {
          'studentId': Provider.of<AuthController>(Get.context!, listen: false).std!.Id,
          'stopId': stop_id,
        },
      );
      print("data add:${response}");

      if (response.statusCode == 200) {
        // Update the state of isFavourite
        allStops[index].isFavourite = false;
        favouriteStops.remove(allStops[index]);
      } else {
        print("Error: ${response.statusCode} - ${response.data}");
      }
    } catch (e) {
      print("Exception: $e");
    }
    notifyListeners();
  }

  Future<void> getFavouriteStops() async {
    try {
      isLoading = true;
      var response = await Dio().get(
        '${APIHandler().base_url}Student/GetFavStops?id=${Provider.of<AuthController>(Get.context!, listen: false).std!.Id}',
      );
      if (response.statusCode == 200) {
        favouriteStops = [];
        for (var element in response.data) {
          favouriteStops.add(StopInfoModel.fromJson(element));
        }
      } else {
        // EasyLoading.showToast('Failed to load favourite stops');
      }
    } catch (e) {
      print(e);
      // EasyLoading.showToast('An error occurred');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getAllStops() async {
    try {
      isLoading = true;
      notifyListeners();
      var response = await Dio().get(
        '${APIHandler().base_url}Stops/GetAllStops?id=${Provider.of<AuthController>(Get.context!, listen: false).std!.Id}',
      );
      if (response.statusCode == 200) {
        allStops = [];
        for (var element in response.data) {
          allStops.add(StopInfoModel.fromJson(element));
        }
      } else {
        EasyLoading.showToast('Failed to load stops');
      }
    } catch (e) {
      print(e);
      // EasyLoading.showToast('An error occurred');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getAllRoute() async {
    try {
      isLoading = true;
      notifyListeners();
      
      var response = await Dio().get('${APIHandler().base_url}Stops/GetAllRoutes');

      if (response.statusCode == 200) {
        allroute = [];
        for (var routeList in response.data) {
          List<RouteInfoModel> routeModels = [];
          for (var element in routeList) {
            routeModels.add(RouteInfoModel.fromJson(element));
          }
          allroute.add(routeModels);
        }
      } else {
        // EasyLoading.showToast('Failed to load routes');
      }
    } catch (e) {
      print(e);
      // EasyLoading.showToast('An error occurred');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
    Future<void> getBus() async {
    try {
   //  String url = '${APIHandler().base_url}Bus/GetBusesLocations'
      isLoading = true;
      notifyListeners();
      var response = await Dio().get(
        '${APIHandler().base_url}Bus/GetBusesLocations',
       // 'http://192.168.230.143/WebApi/api/Bus/GetBusesLocations'
        
        
      );

      if (response.statusCode == 200) {
        allbuses = [];
        for (var element in response.data) {
          allbuses.add(BusesLocation.fromJson(element));
        }
      } else {
        EasyLoading.showToast('Failed to load stops');
      }
    } catch (e) {
      print(e);
      // EasyLoading.showToast('An error occurred');
    } finally {
      isLoading = false;
      notifyListeners();
    }
   // return allbuses;
  }
}
