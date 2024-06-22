import 'package:flutter/material.dart';
import 'package:fyp_project/Model/ChildrenModel.dart';
import 'package:fyp_project/controller/AuthController.dart';
import 'package:fyp_project/controller/HistoryController.dart';
//import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';


class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  DateTime selectedDate = DateTime.now();
  DateTime selectedDate1 = DateTime.now();
  Future<DateTime?> pickDate() => showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );
  Future<DateTime?> pickDate1() => showDatePicker(
        context: context,
        initialDate: selectedDate1,
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );
  // List of data for the container two containers

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    if (Provider.of<AuthController>(context, listen: false)
            .loggedInUser!
            .userRole
            .toLowerCase() ==
        'parent') {
     // Provider.of<Historycontroller>(context, listen: false).getChildrens();
    } else {
      Provider.of<Historycontroller>(context, listen: false).getStudentHistory(
          studentId: Provider.of<AuthController>(context, listen: false)
                  .std!
                  .Id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade400,
        centerTitle: true,
        title: const Text('History'),
      ),
      body: SingleChildScrollView(
        child: Consumer<Historycontroller>(
            builder: (context, historyController, child) {
          return Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 160,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white, // Set border color
                        width: 1.0, // Set border width
                      ),
                      borderRadius:
                          BorderRadius.circular(10.0), // Set border radius
                    ),
                    child: Row(
                      children: [
                        const Text(
                          "From: ",
                          style: TextStyle(color: Colors.white),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(100, 10),
                          ),
                          child: Text(
                            '${selectedDate.year}/${selectedDate.month}/${selectedDate.day}',
                            style: const TextStyle(
                                color: Colors.white), // Set text color
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
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 45,
                  ),
                  Container(
                    height: 40,
                    width: 150,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white, // Set border color
                        width: 1.0, // Set border width
                      ),
                      borderRadius:
                          BorderRadius.circular(10.0), // Set border radius
                    ),
                    child: Row(
                      children: [
                        const Text(
                          "To: ",
                          style: TextStyle(color: Colors.white),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(100, 10),
                          ),
                          child: Text(
                            '${selectedDate1.year}/${selectedDate1.month}/${selectedDate1.day}',
                            style: const TextStyle(
                                color: Colors.white), // Set text color
                          ),
                          onPressed: () async {
                            final date2 = await pickDate1();
                            if (date2 == null) return; // press cancel

                            setState(() {
                              //press ok
                              selectedDate = date2;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              if (Provider.of<AuthController>(context, listen: false)
                      .loggedInUser!
                      .userRole
                      .toLowerCase() ==
                  'parent')
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: DropdownButtonFormField<ChildrenModel>(
                    dropdownColor: Colors.teal.shade400,
                    elevation: 0,
                    icon: const Icon(
                      Icons.child_care,
                      color: Colors.white,
                    ),
                    value: historyController.childrens.isNotEmpty
                        ? historyController.childrens[0]
                        : null,
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        // disabledBorder: OutlineInputBorder(
                        //     borderSide: BorderSide(color: Colors.white)),
                        hintStyle: TextStyle(color: Colors.white),
                        hintText: 'Select Child',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                    items: List.generate(
                      historyController.childrens.length,
                      (index) => DropdownMenuItem<ChildrenModel>(
                          value: historyController.childrens[index],
                          child: Text(
                       //    historyController.childrens[index].regno,
                            "abc",
                            style: const TextStyle(color: Colors.white),
                          )),
                    ),
                    onChanged: (value) => historyController.getStudentHistory(
                        studentId: 1),
                  ),
                ),
              const SizedBox(
                height: 10,
              ),
              // Add the first container
              // ListView.builder for dynamic containers
              historyController.isLoadingHistory
                  ? const Center(
                      child: CircularProgressIndicator.adaptive(
                        backgroundColor: Colors.white,
                      ),
                    )
                  : historyController.histories.isEmpty
                      ? const Text('No history found ')
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: historyController.histories.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              // height: index == containerData.length - 1 ? 85 : 140,
                              padding: const EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Stack(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        historyController
                                                .histories[index].type ??
                                            '',
                                        style: const TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        historyController
                                                .histories[index].stopName ??
                                            '',
                                        style: const TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        historyController
                                                .histories[index].bus!.regno ??
                                            '',
                                        style: const TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      historyController.histories[index].time ??
                                          '', // Your time here
                                      style: const TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
            ],
          );
        }),
      ),
    );
  }
}
