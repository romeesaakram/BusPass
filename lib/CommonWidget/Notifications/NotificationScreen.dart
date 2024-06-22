import 'package:flutter/material.dart';
import 'package:fyp_project/CommonWidget/Notifications/NotificationDetails.dart';
import 'package:fyp_project/Model/UserModel.dart';
import 'package:fyp_project/controller/AuthController.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../Model/Notification.dart';

class NotificationScreen extends StatefulWidget {
   NotificationScreen({super.key, required Student student});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
    late AuthController authController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
 WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AuthController>(context, listen: false).getNotifications();
 });
   // Provider.of<AuthController>(context, listen: false);
    
/*
    studentStopsController = Provider.of<StudentStopsController>(context, listen: false);
  await studentStopsController.getBus();*/
  }
  void GetNoti() async {
 authController  = Provider.of<AuthController>(context, listen: false);
           await authController.getNotifications();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade400,
        title: const Text('Notification'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<AuthController>(
              builder: (context, authController, child) {
            return ListView.separated(
                itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //       builder: (context) => NotificationDetails(
                        //             notificationData:
                        //                 authController.notificatins[index],
                        //           )),
                        // );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          // color: Colors.teal.shade500,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 20.0,
                              spreadRadius: 5.0,
                            ),
                          ],
                          border: Border.all(
                            color: Colors.white,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  authController.notifications[index].Type.toString(),
                                  style: const TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  authController
                                      .notifications[index].Description.toString(),
                                  style: const TextStyle(
                                    fontSize: 10.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                authController.notifications[index].Time.toString()
                                    .split('.')
                                    .first,
                                style: const TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemCount: authController.notifications.length);
          })),
    );
  }
}
