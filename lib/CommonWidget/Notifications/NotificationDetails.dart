import 'package:flutter/material.dart';

import 'package:fyp_project/CommonWidget/Notifications/NotificationScreen.dart';

import '../../Model/Notification.dart';

class NotificationDetails extends StatefulWidget {
  final NotificationData notificationData;
  const NotificationDetails({super.key, required this.notificationData});

  @override
  State<NotificationDetails> createState() => _NotificationDetailsState();
}

class _NotificationDetailsState extends State<NotificationDetails> {
  DateTime selectedDate = DateTime.now();
  Future<DateTime?> pickDate() => showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );
  DateTime selectedTime = DateTime.now();

  Future<void> pickTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(selectedTime),
    );
    if (time != null) {
      setState(() {
        selectedTime = DateTime(
          selectedTime.year,
          selectedTime.month,
          selectedTime.day,
          time.hour,
          time.minute,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade400,
        title: const Text(
          'Notification Details',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Image.asset(
                'assets/images/Rectangle.png', // Replace this with your background image path
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.topCenter,
                height: 280,
                fit: BoxFit.fitHeight,
              ),
              // Add another image on top of the background image

              Image.asset(
                'assets/images/CheckOut.png',
                // Replace this with your overlay image path
                width: 200,
                height: 200,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 30),

              // Text positioned on top of the logo image
              const Positioned(
                top:
                    210, // Adjust the top position according to your requirement
                child: Text(
                  'Check Out!',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              // Add text field below the logo
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: 324,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                Container(
                  // Wrapper Container for text
                  alignment: Alignment
                      .centerLeft, // Align text to the start (left side)
                  padding: const EdgeInsets.only(
                      left: 20.0, top: 30), // Add left padding for spacing
                  child: Text(
                    "Date:",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal.shade400,
                    ),
                  ),
                ),
                Container(
                  // Wrapper Container for text
                  alignment: Alignment
                      .centerLeft, // Align text to the start (left side)
                  padding: const EdgeInsets.only(
                      left: 50.0, top: 0), // Add left padding for spacing
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(100, 10),
                      backgroundColor: Colors.white,
                    ),
                    child: Text(
                      '${selectedDate.year}/${selectedDate.month}/${selectedDate.day}',
                      style: TextStyle(
                          color: Colors.teal.shade400), // Set text color
                    ),
                    onPressed: () async {
                      final date = await pickDate();
                      if (date == null) return; // press cancel

                      setState(() {
                        //press ok
                        selectedDate = date;
                      });
                    },
                  ),
                ),
                Container(
                  // Wrapper Container for text
                  alignment: Alignment
                      .centerLeft, // Align text to the start (left side)
                  padding: const EdgeInsets.only(
                      left: 20.0, top: 30), // Add left padding for spacing
                  child: Text(
                    "Time:",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal.shade400,
                    ),
                  ),
                ),
                Container(
                    // Wrapper Container for text
                    alignment: Alignment
                        .centerLeft, // Align text to the start (left side)
                    padding: const EdgeInsets.only(
                        left: 50.0, top: 0), // Add left padding for spacing
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(100, 10),
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () async {
                        await pickTime();
                      },
                      child: Text(
                        '${selectedTime.hour}:${selectedTime.minute}',
                        style: TextStyle(color: Colors.teal.shade400),
                      ),
                    )),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: 300,
                  height: 3,
                  decoration: BoxDecoration(
                    color: Colors.teal.shade200,
                  ),
                ),
                Container(
                  // Wrapper Container for text
                  alignment: Alignment
                      .centerLeft, // Align text to the start (left side)
                  padding: const EdgeInsets.only(
                      left: 20.0, top: 20), // Add left padding for spacing
                  child: Text(
                    "Description:",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal.shade300,
                    ),
                  ),
                ),
                Container(
                  // Wrapper Container for text
                  alignment: Alignment
                      .centerLeft, // Align text to the start (left side)
                  padding: const EdgeInsets.only(
                      left: 60.0, top: 5), // Add left padding for spacing
                  child: Text(
                    "Check Out At University",
                    style: TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                      color: Colors.teal.shade400,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
