import 'package:flutter/material.dart';
import 'package:fyp_project/Admin/AddScreen.dart';
import 'package:fyp_project/Admin/AddStudentScreen.dart';
import 'package:fyp_project/Admin/AdddAdminScreen.dart';
import 'package:fyp_project/Admin/AdminDashbord.dart';
import 'package:fyp_project/Admin/AdmoinHomeScreen.dart';
import 'package:fyp_project/Admin/JourneyUpdate.dart';
import 'package:fyp_project/Admin/MapScreen.dart';
import 'package:fyp_project/Conductor/ConductorDashbord.dart';
import 'package:fyp_project/Conductor/ConductorHome.dart';
import 'package:fyp_project/Conductor/ConductorMapScreen.dart';
import 'package:fyp_project/Organization/Dashbord.dart';
import 'package:fyp_project/Parent/ParentMap.dart';
import 'package:fyp_project/Student/MapScreen.dart';
import 'package:fyp_project/Student/StudentDasbord.dart';
import 'package:fyp_project/controller/AuthController.dart';
import 'package:fyp_project/controller/ConductorController.dart';
import 'package:fyp_project/controller/HistoryController.dart';
import 'package:fyp_project/controller/StopsController.dart';

import 'LoginScreen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => Historycontroller(),
    ),
    ChangeNotifierProvider(
      create: (context) => ConductorController(),
    ),
    ChangeNotifierProvider(
      create: (context) => AuthController(),
    ),
    ChangeNotifierProvider(
      create: (context) => StudentStopsController(),
    ),
  ], child: const MyApp()));
  initLoading();
}

initLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.teal.shade800,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.teal.shade400,
          )),
      home: const loginScreen(),
    );
  }
}
