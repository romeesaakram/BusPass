import 'package:flutter/material.dart';
class AddAdminScreen extends StatefulWidget {
  const AddAdminScreen({super.key});

  @override
  State<AddAdminScreen> createState() => _AddAdminScreenState();
}

class _AddAdminScreenState extends State<AddAdminScreen> {

  
    String? _selectedgender;

     TextEditingController nameController = TextEditingController();
      TextEditingController conctController = TextEditingController();
       TextEditingController pswdController = TextEditingController();

    
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(   appBar: AppBar(
      backgroundColor: Colors.teal.shade400,
      title: Text('Add New Admin'),
    ),
    body:SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 350,
                height: 400,
                decoration: BoxDecoration(
                  color: Colors.teal.shade800,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.white, // Border color
                    width: 1.0,         // Border width
                  ),
                ),
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                      
                        'Admin  Details',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(height: 5), // Add space between the text and the text fields
                        TextField(
                      cursorColor: Colors.white,
                      controller: nameController,
                      style:  TextStyle(color: Colors.white),
                      decoration:  InputDecoration(
                        hintText: 'Name',
                        hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 14, // Set the font size of the hint text
                            fontStyle: FontStyle.italic),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                      
                      TextField(
                      cursorColor: Colors.white,
                      controller: conctController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Contact No',
                        hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 14, // Set the font size of the hint text
                            fontStyle: FontStyle.italic),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                      TextField(
                      cursorColor: Colors.white,
                      controller: pswdController,
                      style:  const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 14, // Set the font size of the hint text
                            fontStyle: FontStyle.italic),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                     DropdownButton<String>(
                  value: _selectedgender,
                  hint: Text('Select Gender',
                  style: TextStyle(color: Colors.white), ),
                   style: TextStyle(color: Colors.white),
                    dropdownColor: Colors.teal.shade700, 
                  items: <String>['Male', 'Female', ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedgender = newValue;
                    });
                  },
                ),
                      
            
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15), // Add some space between the container and the button
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
              
             
                  ],
          ),
        ),
    ),
      
    );
  }
  
}
