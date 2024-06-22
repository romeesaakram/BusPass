import 'package:flutter/material.dart';
import 'package:fyp_project/Model/UserModel.dart';
import 'package:fyp_project/Student/FavouriteStop.dart';
import 'package:fyp_project/controller/AuthController.dart';
import 'package:fyp_project/controller/StopsController.dart';
import 'package:provider/provider.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({Key? key, required Student student}) : super(key: key);

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late AuthController authController;
  bool isFirstTime = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (isFirstTime) {
      Provider.of<StudentStopsController>(context, listen: false)
          .getFavouriteStops();
      _pageController.addListener(() {
        setState(() {
          _currentPage = _pageController.page!.round();
        });
      });
      isFirstTime = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthController>(context, listen: false);

    // Get remaining journeys and calculate the progress value
    final int remainingJourneys = authController.std?.RemainingJourneys ?? 0;
    final int totalJourneys = authController.std?.TotalJourneys ?? 0;
    final double progressValue =
        totalJourneys > 0 ? remainingJourneys / totalJourneys : 0.0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade400,
        title: const Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 350,
              height: 150,
              child: Align(
                alignment: Alignment.topCenter,
                child: Stack(
                  children: <Widget>[
                    SizedBox(
                      width: 110,
                      height: 110,
                      child: CircularProgressIndicator(
                        strokeWidth: 7.0,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.teal.shade300),
                        value: progressValue,
                      ),
                    ),
                    Positioned.fill(
                      child: Center(
                        child: Text(
                          '$remainingJourneys% \n remaining journeys',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Consumer<StudentStopsController>(
                builder: (context, stopsController, child) {
              return Center(
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: 300,
                      height: 380,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black
                                .withOpacity(0.2), // Set shadow color
                            blurRadius: 20.0, // Set blur radius
                            spreadRadius: 5.0, // Set spread radius
                          ),
                        ],
                        border: Border.all(
                          color: Colors.black26,
                          width: 1.0,
                        ),
                        color: Colors.teal.shade500,
                        borderRadius:
                            BorderRadius.circular(20.0), // Set border radius
                      ),
                    ),
                    const Positioned(
                      top:
                          20, // Adjust this value to position the text vertically
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Text(
                          'Favourite Stops',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
                                  builder: (context) => const FavouriteStop()),
                            ); // Add your button onPressed functionality here
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.white, // Set background color
                          ),
                          child: Text(
                            ' EDIT FAVOURITE STOPS',
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
                      top:
                          60, // Adjust this value to position the second container vertically
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          width: 280, // Set the width of the second container
                          height: 240, // Set the height of the second container
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            // border: Border.all(
                            //   color: Colors.white,
                            //   width: 1.0,
                            // ),
                          ),
                          child: PageView(
                            controller: _pageController,
                            scrollDirection: Axis.horizontal,
                            children: List.generate(
                              stopsController.favouriteStops.length,
                              (index) => Container(
                                width: 260,
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
                                      top: 30,
                                      left: 0,
                                      right: 0,
                                      child: Center(
                                        child: Text(
                                          stopsController
                                                  .favouriteStops[index].Name.toString(),
                                              
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize:
                                                20, // Adjust the font size as needed
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),

                                    // Two containers in a row
                                    Positioned(
                                      top: 80,
                                      left: 10,
                                      right: 10,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Container(
                                              width: 110,
                                              height: 115,
                                              decoration: BoxDecoration(
                                                color: Colors.teal.shade700,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Image.asset(
                                                    'assets/images/Stop.png',
                                                    width:
                                                        50, // Adjust width as needed
                                                    height:
                                                        50, // Adjust height as needed
                                                  ),
                                                  const SizedBox(
                                                      height:
                                                          5), // Adjust the spacing between image and text
                                                  const Text(
                                                    'Route No',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      // fontSize: 12, // Adjust the font size as needed
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5),
                                                  Text(
                                                    stopsController
                                                        .favouriteStops[index]
                                                        .Route
                                                        .toString(),
                                                    style: const TextStyle(
                                                      color: Colors.white,
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
                                                color: Colors.teal.shade700,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                // half of width and height for a perfect circle
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Image.asset(
                                                    'assets/images/BusStop.png',
                                                    width:
                                                        70, // Adjust width as needed
                                                    height:
                                                        60, // Adjust height as needed
                                                  ), // Adjust color as needed
                                                  const SizedBox(
                                                      height:
                                                          1), // Adjust the spacing between image and text
                                                  const Text(
                                                    'Stop Timing',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      // fontSize: 12, // Adjust the font size as needed
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5),
                                                  Text(
                                                    stopsController
                                                            .favouriteStops[
                                                                index]
                                                            .Timing ??
                                                        '',
                                                    style: const TextStyle(
                                                      color: Colors.white,
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
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 65,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: _buildPageIndicator(stopsController),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildPageIndicator(StudentStopsController stopsController) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(stopsController.favouriteStops.length, (index) {
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
