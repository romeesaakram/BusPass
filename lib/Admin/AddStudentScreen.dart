import 'package:flutter/material.dart';
class AddStudentScreen extends StatefulWidget {
  AddStudentScreen({super.key});

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController regController = TextEditingController();
  TextEditingController conctController = TextEditingController();
  TextEditingController pswdController = TextEditingController();
  TextEditingController journyController = TextEditingController();
   String? _selectedparent;
    String? _selectedgender;

     TextEditingController pnameController = TextEditingController();
      TextEditingController pconctController = TextEditingController();
       TextEditingController ppswdController = TextEditingController();

     bool showNewParentContainer = false;
  bool showExistingParentContainer = false;

     DateTime selectedDate = DateTime.now();
   Future<DateTime?> pickDate() => showDatePicker(
     context: context,
         initialDate: selectedDate,
         firstDate: DateTime(2000),
         lastDate: DateTime(2101),
   );
  @override
  Widget build(BuildContext context) {
    return Scaffold(   appBar: AppBar(
      backgroundColor: Colors.teal.shade400,
      title: Text('Add New Student'),
    ),
    body:SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 350,
                height: 595,
                decoration: BoxDecoration(
                  color: Colors.teal.shade800,
                  borderRadius: BorderRadius.circular(10),
                  // border: Border.all(
                  //   color: Colors.white, // Border color
                  //   width: 1.0,         // Border width
                  // ),
                ),
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                      
                        'Student Details',
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
                      controller: regController,
                      style:  TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Reg No',
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
                      TextField(
                      cursorColor: Colors.white,
                      controller: journyController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Total Journey',
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
                    // SizedBox(height: 10), // Add some space between the container and the button
             Row(
                      children: [
                        Text("Pass Expiray: ",style: TextStyle(color: Colors.white),),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(100, 10),
                          ),
                          child: Text(
                            '${selectedDate.year}/${selectedDate.month}/${selectedDate.day}',
                            style: TextStyle(color: Colors.white), // Set text color
                          ),
                          onPressed: () async{
                            final date=await pickDate();
                            if (date== null) return;// press cancel
    
                            setState(() {   //press ok
                              selectedDate=date;
                            });
                          },
                        ),
                      ],
                    ),
             // SizedBox(height: 5), // Add some space between the button and the dropdowns
             Row(
                        children: [
                          Text(
                            'Gender: ',
                            style: TextStyle(color: Colors.white),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Radio<String>(
                                  value: 'Male',
                                  groupValue: _selectedgender,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedgender = value;
                                    });
                                  },
                                  activeColor: Colors.white,
                                ),
                                Text(
                                  'Male',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Radio<String>(
                                  value: 'Female',
                                  groupValue: _selectedgender,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedgender = value;
                                    });
                                  },
                                  activeColor: Colors.white,
                                ),
                                Text(
                                  'Female',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
            //  SizedBox(height: 4), // Add some space between the dropdowns
              DropdownButton<String>(
                        value: _selectedparent,
                        hint: const Text(
                          'New or Existing parent?',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: const TextStyle(color: Colors.white),
                        dropdownColor: Colors.teal.shade700,
                        items: const <String>['New Parent', 'Existing Parent'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _selectedparent = newValue;
    
                            // Set visibility flags based on the selected value
                            if (_selectedparent == 'New Parent') {
                              showNewParentContainer = true;
                              showExistingParentContainer = false;
                            } else if (_selectedparent == 'Existing Parent') {
                              showNewParentContainer = false;
                              showExistingParentContainer = true;
                            } else {
                              showNewParentContainer = false;
                              showExistingParentContainer = false;
                            }
                          });
                        },
                      ),
                      // Container for New Parent
                      Visibility(
                        visible: showNewParentContainer,
                        child: Container(
                                width: 300,
                                height: 164,
                                decoration: BoxDecoration(
                                  color: Colors.teal.shade800,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.white, // Border color
                                    width: 1.0,         // Border width
                                  ),
                                ),
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                //  crossAxisAlignment: CrossAxisAlignment.start,
                                 // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                            
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                         TextField(
                      cursorColor: Colors.white,
                      controller: pnameController,
                      style:  TextStyle(color: Colors.white),
                      decoration: InputDecoration(
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
                      controller: pconctController,
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
                      controller: ppswdController,
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
                      
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                                                  ),
                      // Container for Existing Parent
                      Visibility(
                        visible: showExistingParentContainer,
                        child: Container(
                              width: 300,
                              height: 164,
                              decoration: BoxDecoration(
                                color: Colors.teal.shade800,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.white, // Border color
                                  width: 1.0,         // Border width
                                ),
                              ),
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                                                        TextFormField(
                                        // Add properties for the search TextFormField
                                        decoration: InputDecoration(
                                          hintText: 'Search By Name',
                                          hintStyle: TextStyle(color: Colors.white),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.white), // Set the border color
                                          ),
                                        ),
                                        style: TextStyle(color: Colors.white),
                                      ),
                                  SizedBox(height: 8), // Add some space between the search field and the text
                                  Text(
                                    '       Romesa Akram \n        Hammad Akram', // Replace 'Your search text here' with your actual search text
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                                                ),
                    ],
                  ),
                ),
              ),
            //  SizedBox(height: 15), // Add some space between the container and the button
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