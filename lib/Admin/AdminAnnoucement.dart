import 'package:flutter/material.dart';

class AdminAnnoucement extends StatefulWidget {
  const AdminAnnoucement({super.key});

  @override
  State<AdminAnnoucement> createState() => _AdminAnnoucementState();
}

class _AdminAnnoucementState extends State<AdminAnnoucement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Container(
          child: Column(
            children: [
              Center(
                child: Image.asset('assets/images/Logo.png'),
              ),
              const SizedBox(
                height: 2,
              ),
              Container(
                width: 295,
                height: 200,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 20.0,
                      spreadRadius: 5.0,
                    ),
                  ],
                  border: Border.all(
                    color: Colors.black26,
                    width: 1.0,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0), // Adjust padding as needed
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder
                          .none, // Remove the border of the text field
                      hintText: 'Type here...', // Placeholder text
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(builder: (context) => fvtstop()),
                  // ); // Add your button onPressed functionality here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  fixedSize: const Size(180, 50), // Set background color
                ),
                child: Text(
                  ' SEND',
                  style: TextStyle(
                    color: Colors.teal.shade800, // Set text color
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
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
