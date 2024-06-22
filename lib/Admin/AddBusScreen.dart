import 'package:flutter/material.dart';
class AddBusScreen extends StatefulWidget {
  const AddBusScreen({super.key});

  @override
  State<AddBusScreen> createState() => _AddBusScreenState();
}

class _AddBusScreenState extends State<AddBusScreen> {
  TextEditingController seatsController = TextEditingController();
  TextEditingController regController = TextEditingController();

  List<String> checkboxOptions = ['Sadar to Chandni Chowk', 'Chandni to Sadar'];
  List<bool> selectedCheckboxes = [false, false];

  bool showNewConductorContainer = false;
  bool showExistingConductorContainer = false;
  String? _selectedConductor;
  TextEditingController cnameController = TextEditingController();
  TextEditingController cconctController = TextEditingController();
  TextEditingController cpswdController = TextEditingController();
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade400,
        title: Text('Add Bus'),
      ),
      body: SingleChildScrollView(
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
                  border: Border.all(
                    color: Colors.white,
                    width: 1.0,
                  ),
                ),
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bus Details',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(height: 5),
                      TextField(
                        cursorColor: Colors.white,
                        controller: regController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Reg No',
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
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
                        controller: seatsController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'No Of Seats',
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontStyle: FontStyle.italic),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      PopupMenuButton<int>(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Select Routes Here',
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(Icons.arrow_drop_down, color: Colors.white),
                            ],
                          ),
                        ),
                        onSelected: (int index) {
                          setState(() {
                            selectedCheckboxes[index] = !selectedCheckboxes[index];
                          });
                        },
                        itemBuilder: (BuildContext context) {
                          return List.generate(checkboxOptions.length, (int index) {
                            return PopupMenuItem<int>(
                              value: index,
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: selectedCheckboxes[index],
                                    onChanged: (bool? value) {
                                      setState(() {
                                        selectedCheckboxes[index] = value!;
                                      });
                                    },
                                  ),
                                  Text(checkboxOptions[index]),
                                ],
                              ),
                            );
                          });
                        },
                      ),
                      SizedBox(height: 4), // Add some space between the dropdowns
                      DropdownButton<String>(
                        value: _selectedConductor,
                        hint: const Text(
                          'New or Existing Conductor?',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: const TextStyle(color: Colors.white),
                        dropdownColor: Colors.teal.shade700,
                        items: const <String>['New Conductor', 'Existing Conductor'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _selectedConductor = newValue;

                            // Set visibility flags based on the selected value
                            if (_selectedConductor == 'New Conductor') {
                              showNewConductorContainer = true;
                              showExistingConductorContainer = false;
                            } else if (_selectedConductor == 'Existing Conductor') {
                              showNewConductorContainer = false;
                              showExistingConductorContainer = true;
                            } else {
                              showNewConductorContainer = false;
                              showExistingConductorContainer = false;
                            }
                          });
                        },
                      ),
                      // Container for New Conductor
                      Visibility(
                        visible: showNewConductorContainer,
                        child: Container(
                          width: 300,
                          height: 230,
                          decoration: BoxDecoration(
                            color: Colors.teal.shade800,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.white,
                              width: 1.0,
                            ),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextField(
                                      cursorColor: Colors.white,
                                      controller: cnameController,
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        hintText: 'Name',
                                        hintStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
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
                                      controller: cconctController,
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        hintText: 'Contact No',
                                        hintStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
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
                                      controller: cpswdController,
                                      style: const TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        hintText: 'Password',
                                        hintStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontStyle: FontStyle.italic),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
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
                                                groupValue: _selectedGender,
                                                onChanged: (value) {
                                                  setState(() {
                                                    _selectedGender = value;
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
                                                groupValue: _selectedGender,
                                                onChanged: (value) {
                                                  setState(() {
                                                    _selectedGender = value;
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
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Container for Existing Conductor
                      Visibility(
                        visible: showExistingConductorContainer,
                        child: Container(
                          width: 300,
                          height: 164,
                          decoration: BoxDecoration(
                            color: Colors.teal.shade800,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.white,
                              width: 1.0,
                            ),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Search By Name',
                                  hintStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(height: 8), // Add some space between the search field and the text
                              Text(
                                '       Romesa Akram \n        Hammad Akram',
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
              ElevatedButton(
                onPressed: () {
                  // Add functionality for the button here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: Size(200, 30),
                ),
                child: Text(
                  'ADD',
                  style: TextStyle(
                    color: Colors.teal.shade800,
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