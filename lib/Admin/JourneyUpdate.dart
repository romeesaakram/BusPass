import 'package:flutter/material.dart';

class JourneyUpdate extends StatefulWidget {
  const JourneyUpdate({super.key});

  @override
  State<JourneyUpdate> createState() => _JourneyUpdateState();
}

class _JourneyUpdateState extends State<JourneyUpdate> {
  TextEditingController journyController = TextEditingController();
     DateTime selectedDate = DateTime.now();
   Future<DateTime?> pickDate() => showDatePicker(
     context: context,
         initialDate: selectedDate,
         firstDate: DateTime(2000),
         lastDate: DateTime(2101),
           );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade400,
        title: Text(' Journeys Update'),
      ),
       body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: 350,
                  height: 470,
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
                    color: Colors.teal.shade500,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/Satisfy.png',
                        fit: BoxFit.contain, // Adjust fit to your requirement
                        width: 100, // Adjust width as needed
                        height: 100, // Adjust height as needed
                      ),
                      const SizedBox(width: 10), // Space between image and text
                    // Space between image and text
                      const Text(
                        'Pass Status: Valid',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                       SizedBox(height: 10),
                       Container(
                        height: 170,
                              padding: EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: Colors.teal.shade500,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: Colors.white, // Set the border color
                                  width: 2.0, // Set the border width
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextField(
                                    cursorColor: Colors.white,
                                    controller: journyController,
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      hintText: 'No Of Journey',
                                      hintStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14, // Set the font size of the hint text
                                        fontStyle: FontStyle.italic,
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Text(
                                        "Pass Expiry: ",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          fixedSize: Size(100, 10),
                                        ),
                                        child: Text(
                                          '${selectedDate.year}/${selectedDate.month}/${selectedDate.day}',
                                          style: TextStyle(color: Colors.white), // Set text color
                                        ),
                                        onPressed: () async {
                                          final date = await pickDate();
                                          if (date == null) return; // press cancel

                                          setState(() {
                                            // press ok
                                            selectedDate = date;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                           Column (

        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
           ElevatedButton(
                onPressed: () {
                  // Add functionality for the button here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Set background color
                  minimumSize: Size(200, 30),    // Set button size
                ),
                child: Text(
                  'ADD',
                  style: TextStyle(
                    color: Colors.teal.shade800, // Set text color
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              
           ElevatedButton(
                onPressed: () {
                  // Add functionality for the button here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Set background color
                  minimumSize: Size(200, 30),    // Set button size
                ),
                child: Text(
                  'Close',
                  style: TextStyle(
                    color: Colors.teal.shade800, // Set text color
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              
        ],

                            )

                             ],
                    ),
                     
                    
                      
                    

                  ),
                ),
            ]
              ),
            ),
      
    );
  }
}
