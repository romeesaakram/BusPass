import 'package:dio/dio.dart';

class APIHandler {
  static int? loggedInUserId;
  String base_url = 'http://192.168.230.143/WebApi/api/';
  

  Future<Response> login({required String username, required String password}) async {
    String url = "${base_url}Users/Login?username=$username&password=$password";

    var response = await Dio().get(url);
   //EasyLoading.dismiss();

    return response;
  }
}



