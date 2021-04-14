import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// import 'package:sliding_up_panel/sliding_up_panel.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class Subpage extends StatefulWidget {
  @override
  _SubpageState createState() => _SubpageState();
}

class _SubpageState extends State<Subpage> {
  // final _auth = FirebaseAuth.instance;
  final testRef = FirebaseDatabase.instance.reference().child("Categories");
  var subCat = ['FC1', 'FC2', 'Apoorva'];
  Position currentPosition;
  var geoLocator = Geolocator();
  static const LatLng _center = const LatLng(28.5987135, 77.3181042);
  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  GoogleMapController newGoogleMapController;

  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    LatLng latLngPosition = LatLng(position.latitude, position.longitude);
    CameraPosition cameraPosition = new CameraPosition(target: latLngPosition, zoom: 15);
    newGoogleMapController.animateCamera(
        CameraUpdate.newCameraPosition(cameraPosition));

  }

  // LatLng _lastMapPosition = _center;

  List<Marker> allMarkers= [];
  @override
  void initState(){
    super.initState();
    allMarkers.add(Marker(
      markerId: MarkerId('MyMarker'),
      draggable: true,
      onTap: (){
        print("Marker Tapped");
      },
      position: LatLng(28.5987135, 77.3181042),
      onDragEnd: ((newPosition) {
        print(newPosition.latitude);
        print(newPosition.longitude);
      }),
    ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [

                Container(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 85),
                  child: GoogleMap(
                    onMapCreated: (GoogleMapController controller) {
                      _controllerGoogleMap.complete(controller);
                      newGoogleMapController = controller;
                      locatePosition();
                    },
                    // onCameraMove: _onCameraMove,
                    mapType: MapType.normal,
                    myLocationButtonEnabled: true,
                    myLocationEnabled: true,
                    zoomGesturesEnabled: true,
                    zoomControlsEnabled: true,
                    initialCameraPosition:
                    CameraPosition(target: _center, zoom: 8),
                    markers: Set.from(allMarkers),
                  ),
                ),

                DraggableScrollableSheet(
                    initialChildSize: 0.1,
                    minChildSize: 0.1,
                    maxChildSize: 0.7,
                    builder: (context, scrollController) {
                      return SingleChildScrollView(
                        controller: scrollController,
                        child: Container(

                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.9),
                          ),
                          child: Column(
                            children: [

                              Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.fromLTRB(40, 25, 0, 0),
                                child: Text("Eateries", style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold)),
                              ),

                              Container(
                                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  children: [
                                    Card(
                                      child: InkWell(
                                        splashColor: Colors.blue.withAlpha(30),
                                        onTap: () {
                                          print('Card tapped.');
                                        },
                                        child: const SizedBox(
                                          width: 320,
                                          height: 120,
                                          child: Text(
                                              'A card that can be tapped'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  children: [
                                    Card(
                                      child: InkWell(
                                        splashColor: Colors.blue.withAlpha(30),
                                        onTap: () {
                                          print('Card tapped.');
                                        },
                                        child: const SizedBox(
                                          width: 320,
                                          height: 120,
                                          child: Text(
                                              'A card that can be tapped'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ), Container(
                                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  children: [
                                    Card(
                                      child: InkWell(
                                        splashColor: Colors.blue.withAlpha(30),
                                        onTap: () {
                                          print('Card tapped.');
                                        },
                                        child: const SizedBox(
                                          width: 320,
                                          height: 120,
                                          child: Text(
                                              'A card that can be tapped'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ), Container(
                                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  children: [
                                    Card(
                                      child: InkWell(
                                        splashColor: Colors.blue.withAlpha(30),
                                        onTap: () {
                                          print('Card tapped.');
                                        },
                                        child: const SizedBox(
                                          width: 320,
                                          height: 120,
                                          child: Text(
                                              'A card that can be tapped'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Container(
                                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  children: [
                                    Card(
                                      child: InkWell(
                                        splashColor: Colors.blue.withAlpha(30),
                                        onTap: () {
                                          print('Card tapped.');
                                        },
                                        child: const SizedBox(
                                          width: 320,
                                          height: 120,
                                          child: Text(
                                              'A card that can be tapped'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ), Container(
                                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  children: [
                                    Card(
                                      child: InkWell(
                                        splashColor: Colors.blue.withAlpha(30),
                                        onTap: () {
                                          print('Card tapped.');
                                        },
                                        child: const SizedBox(
                                          width: 320,
                                          height: 120,
                                          child: Text(
                                              'A card that can be tapped'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                        ),

                      );
                    }),

              ],
            ),
          ),
        ],
      ),
    );
  }

// Widget buildSlidingPanel({
//   @required ScrollController scrollController,
// }) => Container(
//
//   decoration: BoxDecoration(
//       color: Colors.black.withOpacity(0.9),
//   ),
//   child: SingleChildScrollView(
//     child: Column(
//       children: [
//         Container(
//           child:  buildDragIcon()
//         ),
//         Container(
//           alignment: Alignment.centerLeft,
//           margin: EdgeInsets.fromLTRB(40, 30, 0, 0),
//           child: Text("Eateries", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
//         ),
//
//         Container(
//           margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Card(
//                 child: InkWell(
//                   splashColor: Colors.blue.withAlpha(30),
//                   onTap: () {
//                     print('Card tapped.');
//                   },
//                   child: const SizedBox(
//                     width: 320,
//                     height: 120,
//                     child: Text('A card that can be tapped'),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Container(
//           margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Card(
//                 child: InkWell(
//                   splashColor: Colors.blue.withAlpha(30),
//                   onTap: () {
//                     print('Card tapped.');
//                   },
//                   child: const SizedBox(
//                     width: 320,
//                     height: 120,
//                     child: Text('A card that can be tapped'),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),Container(
//           margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Card(
//                 child: InkWell(
//                   splashColor: Colors.blue.withAlpha(30),
//                   onTap: () {
//                     print('Card tapped.');
//                   },
//                   child: const SizedBox(
//                     width: 320,
//                     height: 120,
//                     child: Text('A card that can be tapped'),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),Container(
//           margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Card(
//                 child: InkWell(
//                   splashColor: Colors.blue.withAlpha(30),
//                   onTap: () {
//                     print('Card tapped.');
//                   },
//                   child: const SizedBox(
//                     width: 320,
//                     height: 120,
//                     child: Text('A card that can be tapped'),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//
//         Container(
//           margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Card(
//                 child: InkWell(
//                   splashColor: Colors.blue.withAlpha(30),
//                   onTap: () {
//                     print('Card tapped.');
//                   },
//                   child: const SizedBox(
//                     width: 320,
//                     height: 120,
//                     child: Text('A card that can be tapped'),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),Container(
//           margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Card(
//                 child: InkWell(
//                   splashColor: Colors.blue.withAlpha(30),
//                   onTap: () {
//                     print('Card tapped.');
//                   },
//                   child: const SizedBox(
//                     width: 320,
//                     height: 120,
//                     child: Text('A card that can be tapped'),
//                   ),
//                 ),
//               ),],
//           ),
//         ),
//       ],
//     ),
//   ),
//
// );
//
// Widget buildDragIcon() => Container(
//   margin: EdgeInsets.only(
//     top: 20,
//   ),
//   decoration: BoxDecoration(
//     color: Colors.white.withOpacity(0.4),
//     borderRadius: BorderRadius.circular(8),
//   ),
//   width: 45,
//   height: 8,
// );

}


// Reading from firebase
//final dbRef = FirebaseDatabase.instance.reference().child("medical");

// return FutureBuilder(
// future: dbRef.once(),
// builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
// if (snapshot.hasData) {
//
// Map<dynamic, dynamic> values = snapshot.data.value;
// print(snapshot.data.value);
//
// }  
// return CircularProgressIndicator();
// });
//
