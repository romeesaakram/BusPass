import 'package:flutter/material.dart';

class orgHome extends StatefulWidget {
  const orgHome({super.key});

  @override
  State<orgHome> createState() => _orgHomeState();
}

class _orgHomeState extends State<orgHome> {
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
  }

  @override
  Widget build(BuildContext context) {
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
            Center(
              child: Stack(
                children: <Widget>[
                  Container(
                    width: 300,
                    height: 550,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color:
                              Colors.black.withOpacity(0.2), // Set shadow color
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
                        'All Organizations',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
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
                        height: 460, // Set the height of the second container
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
  children: <Widget>[
    // First Container with Image
    Container(
      width: 260,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: <Widget>[
          // CircularProgressIndicator at the top center
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: SizedBox(
              width: 150,
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
                        value: 0.7, // Change this value according to your progress
                      ),
                    ),
                    const Positioned.fill(
                      child: Center(
                        child: Text(
                          '   1/4 \n Users',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Text at the top center
          const Positioned(
            top: 130, // Adjusted position to be below the CircularProgressIndicator
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'ARID',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20, // Adjust the font size as needed
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // Two containers in a row
          Positioned(
  top: 170, // Adjusted position to be below the text
  left: 10,
  right: 10,
  child: Column(
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 116,
            height: 115,
            decoration: BoxDecoration(
              color: Colors.teal.shade700,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Student',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  '1',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 116,
            height: 115,
            decoration: BoxDecoration(
              color: Colors.teal.shade700,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Parent',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  '1',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      const SizedBox(height: 20), // Spacing between rows
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 116,
            height: 115,
            decoration: BoxDecoration(
              color: Colors.teal.shade700,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Conductors',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  '1',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 116,
            height: 115,
            decoration: BoxDecoration(
              color: Colors.teal.shade700,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Admins',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  '1',
                  style: TextStyle(
                    color: Colors.white,
                  ),
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

    // Second Container with Image

  ],
),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 15,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: _buildPageIndicator(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(2, (index) {
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