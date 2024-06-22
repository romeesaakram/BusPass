import 'package:flutter/material.dart';
import 'package:fyp_project/controller/StopsController.dart';
import 'package:provider/provider.dart';

class FavouriteStop extends StatefulWidget {
  const FavouriteStop({Key? key}) : super(key: key);

  @override
  State<FavouriteStop> createState() => _FavouriteStopState();
}

class _FavouriteStopState extends State<FavouriteStop> {

  bool isFirstTime = true;

  @override
  void didChangeDependencies() {
    if(isFirstTime){
          Provider.of<StudentStopsController>(context, listen: false).getAllStops();
          isFirstTime = false;
    }
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade400,
        title: const Text(
          'Favourite Stops',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Consumer<StudentStopsController>(
        builder: (context, stopsController, child) {
          return stopsController.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: stopsController.allStops.length,
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white, // Set border color
                        width: 1.0, // Set border width
                      ),
                      borderRadius: BorderRadius.circular(10.0), // Set border radius
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          stopsController.allStops[index].Name ?? '',
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 10, // Add some space between the text and checkbox
                        ),
                        Theme(
                          data: ThemeData(
                            unselectedWidgetColor: Colors.white, // Change the color of the checkbox
                          ),
                          child: Checkbox(
                            value: stopsController.allStops[index].isFavourite ?? false,
                            onChanged: (bool? val) async {
                              if (val == true) {
                                stopsController.allStops[index].isFavourite = true;
                                await stopsController.addFavouriteStop(
                                  stop_id: stopsController.allStops[index].Id ?? 0,
                                  index: index,
                                );
                              } else {
                                   stopsController.allStops[index].isFavourite = false;
                                await stopsController.deleteFavouriteStop(
                                  stop_id: stopsController.allStops[index].Id ?? 0,
                                  index: index,
                                );
                              }
                            },
                            fillColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.selected)) {
                                  return Colors.teal; // Change fill color when selected
                                }
                                return Colors.transparent; // Transparent fill for unchecked state
                              },
                            ),
                            checkColor: Colors.white, // Set color for the check mark
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}