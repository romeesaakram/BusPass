import 'package:flutter/material.dart';
import 'package:fyp_project/Model/ChildrenModel.dart';
import 'package:fyp_project/Model/History.dart';
import 'package:fyp_project/controller/AuthController.dart';
import 'package:fyp_project/controller/HistoryController.dart';
import 'package:provider/provider.dart';

import '../Model/AllChildsHistoryModel.dart';
import 'ParentMap.dart';

class ParentHome extends StatefulWidget {
  const ParentHome({super.key});

  @override
  State<ParentHome> createState() => _ParentHomeState();
}

class _ParentHomeState extends State<ParentHome> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

@override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });

    // Schedule the _childrens call using a post-frame callback
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _childrens();
    });
  }
  List<ChildrenModel> childrens = [];
  late Historycontroller historycontroller;

   Future<void> _childrens() async {
    // Add your asynchronous code here
    print('PId:${AuthController.pid}');

   historycontroller = Provider.of<Historycontroller>(context, listen: false);
   historycontroller.fetchChildrenData();
   await historycontroller.getChildrens();
    //  for (var child in historycontroller.getChildrens()) {



    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal.shade400,
          title: const Text('Home'),
        ),
        body: Consumer<Historycontroller>(
            builder: (context, historycontroller, child) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Center(
              child: Stack(
                children: <Widget>[
                  Container(
                    width: 330,
                    height: 610,
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
                  ),
                  const Positioned(
                    top: 10, // Adjust the top position as needed
                    left: 0, // Center horizontally
                    right: 0, // Center horizontally
                    child: Text(
                      'My Children',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    top:
                        40, // Adjust this value to position the second container vertically
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                          width: 310, // Set the width of the second container
                          height: 500, // Set the height of the second container
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            // border: Border.all(
                            //   color: Colors.white,
                            //   width: 1.0,
                            // ),
                          ),
                          child: historycontroller.isLoadingHistory
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : PageView.builder(
                                  controller: _pageController,
                                  itemCount: historycontroller
                                      .childrens.length,
                                  itemBuilder: (context, index) {
                                    ChildrenModel childrens =
                                        historycontroller
                                            .childrens[index];
                                    return Container(
                                      width: 270,
                                      // Width of the container
                                      margin: const EdgeInsets.all(
                                          10), // Adjust the margin as needed
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Stack(
                                        children: <Widget>[
                                          // Text at the top center
                                          Positioned(
                                            top:
                                                20, // Adjust this value to position the text vertically
                                            left: 0,
                                            right: 0,
                                            child: Center(
                                              child: SizedBox(
                                                width: 350,
                                                height: 150,
                                                child: Align(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: Stack(
                                                    children: <Widget>[
                                                      SizedBox(
                                                        width: 110,
                                                        height: 110,
                                                        child:
                                                            CircularProgressIndicator(
                                                          strokeWidth: 7.0,
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                      Color>(
                                                                  Colors.teal
                                                                      .shade300),
                                                          value:
                                                              0.7, // You can change this value according to your progress
                                                        ),
                                                      ),
                                                      Positioned.fill(
                                                        child: Center(
                                                          child: Text(
                                                            childrens.childDetails?.PassId ==
                                                                    null
                                                                ? ""
                                                                : '    ${((childrens.childDetails?.RemainingJourneys ?? 0) * 100) / (childrens.childDetails?.TotalJourneys ?? 0)}% \n journeys',
                                                            // Change this text according to your progress
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 15.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),

                                          Positioned(
                                            top: 145,
                                            left: 0,
                                            right: 0,
                                            child: Text(
                                              historycontroller
                                                      .childrens[
                                                          index]
                                                      .childDetails?.Name ??
                                                  '',
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 19.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),

                                            const Positioned(
                                              top: 180,
                                              left: 0,
                                              right: 0,
                                              child: Text(
                                                'Pick-Up Timings',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),

                                            Positioned(
                                              top: 200,
                                              left: 10,
                                              right: 10,
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Container(
                                                      width: 110,
                                                      height: 115,
                                                      decoration: BoxDecoration(
                                                        color: Colors
                                                            .teal.shade700,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          Image.asset(
                                                            'assets/images/MyStop.png',
                                                            width:
                                                                90, // Adjust width as needed
                                                            height:
                                                                60, // Adjust height as needed
                                                          ),
                                                          // SizedBox(height: 5), // Adjust the spacing between image and text
                                                          const Text(
                                                            'Check In',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              // fontSize: 12, // Adjust the font size as needed
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          //  SizedBox(height: 5),
                                                           Text(
                                                           historycontroller
                                                      .childrens[
                                                          index]
                                                      .childTimings?.PickupCheckin ??
                                                  '',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              // fontSize: 12, // Adjust the font size as needed
                                                              // fontWeight: FontWeight.bold,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 110,
                                                      height: 115,
                                                      decoration: BoxDecoration(
                                                        color: Colors
                                                            .teal.shade700,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        // half of width and height for a perfect circle
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          Image.asset(
                                                            'assets/images/CheckOut.png',
                                                            width:
                                                                50, // Adjust width as needed
                                                            height:
                                                                60, // Adjust height as needed
                                                          ), // Adjust color as needed
                                                          const SizedBox(
                                                              height:
                                                                  1), // Adjust the spacing between image and text
                                                          const Text(
                                                            'CheckOut',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              // fontSize: 12, // Adjust the font size as needed
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          // SizedBox(height: 5),
                                                           Text(
                                                            historycontroller
                                                      .childrens[
                                                          index]
                                                      .childTimings?.PickupCheckout ??
                                                  '',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              // fontSize: 12, // Adjust the font size as needed
                                                              // fontWeight: FontWeight.bold,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ]),
                                            ),
                                            /////////// //Evening  Container
                                            const Positioned(
                                              top: 325,
                                              left: 0,
                                              right: 0,
                                              child: Text(
                                                'Drop-Off Timings',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),

                                            Positioned(
                                              top: 350,
                                              left: 10,
                                              right: 10,
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Container(
                                                      width: 110,
                                                      height: 115,
                                                      decoration: BoxDecoration(
                                                        color: Colors
                                                            .teal.shade700,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          Image.asset(
                                                            'assets/images/MyStop.png',
                                                            width:
                                                                90, // Adjust width as needed
                                                            height:
                                                                60, // Adjust height as needed
                                                          ),
                                                          // SizedBox(height: 5), // Adjust the spacing between image and text
                                                          const Text(
                                                            'Check In',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              // fontSize: 12, // Adjust the font size as needed
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          //  SizedBox(height: 5),
                                                           Text(
                                                            historycontroller
                                                      .childrens[
                                                          index]
                                                      .childTimings?.DropoffCheckin ??
                                                  '',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              // fontSize: 12, // Adjust the font size as needed
                                                              // fontWeight: FontWeight.bold,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 110,
                                                      height: 115,
                                                      decoration: BoxDecoration(
                                                        color: Colors
                                                            .teal.shade700,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        // half of width and height for a perfect circle
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          Image.asset(
                                                            'assets/images/CheckOut.png',
                                                            width:
                                                                50, // Adjust width as needed
                                                            height:
                                                                60, // Adjust height as needed
                                                          ), // Adjust color as needed
                                                          const SizedBox(
                                                              height:
                                                                  1), // Adjust the spacing between image and text
                                                          const Text(
                                                            'CheckOut',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              // fontSize: 12, // Adjust the font size as needed
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          // SizedBox(height: 5),
                                                          Text(
                                                             historycontroller
                                                      .childrens[
                                                          index]
                                                      .childTimings?.DropoffCheckout ??
                                                  '',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              // fontSize: 12, // Adjust the font size as needed
                                                              // fontWeight: FontWeight.bold,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ]),
                                            ),

                                        ],
                                      ),
                                    );
                                  })),
                    ),
                  ),
                  Positioned(
                    bottom:
                        12, // Adjust this value to position the button vertically
                    left: 0,
                    right: 0,
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => ParentMap(
                                    )),
                          ); // Add your button onPressed functionality here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, // Set background color
                        ),
                        child: Text(
                          ' TRACK MY CHILDREN',
                          style: TextStyle(
                            color: Colors.teal.shade800, // Set text color
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 55,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: _buildPageIndicator(historycontroller),
                    ),
                  ),
                ],
              ),
            ),
          );
        }));
  }

  Widget _buildPageIndicator(Historycontroller hiscotryController) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
          List.generate(hiscotryController.childrens.length, (index) {
        return Container(
          width: 10.0,
          height: 10.0,
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == index ? Colors.white : Colors.teal.shade100,
          ),
        );
      }),
    );
  }
}