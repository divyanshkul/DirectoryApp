import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

// import 'package:sliding_up_panel/sliding_up_panel.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class Subpage extends StatefulWidget {
  final String subCat;
  Subpage({Key key, @required this.subCat}) : super(key: key);
  @override
  _SubpageState createState() => _SubpageState();
}

class _SubpageState extends State<Subpage> {
  Map<dynamic,dynamic> markerData;
  List<Widget> catNames = [];
  Query ref, markRef;
  Map<dynamic, dynamic> values;

  Position currentPosition;
  var geoLocator = Geolocator();
  static const LatLng _center = const LatLng(13.353698208659731, 74.78478820836084);
  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  GoogleMapController newGoogleMapController;

  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    // LatLng latLngPosition = LatLng(position.latitude, position.longitude);
    LatLng latLngPosition = LatLng(13.353698208659731, 74.78478820836084);
    CameraPosition cameraPosition = new CameraPosition(
        target: latLngPosition, zoom: 15);
    newGoogleMapController.animateCamera(
        CameraUpdate.newCameraPosition(cameraPosition));
  }

  List<Marker> allMarkers = [];

  @override
  void initState() {
    ref = FirebaseDatabase.instance.reference().child('Categories').parent();
    markRef = FirebaseDatabase.instance.reference().child('Markers');

    super.initState();
    // allMarkers.add(Marker(
    //   markerId: MarkerId('MyMarker'),
    //   draggable: true,
    //   onTap: () {
    //     print("Marker Tapped");
    //   },
    //   position: LatLng(28.5987135, 77.3181042),
    //   onDragEnd: ((newPosition) {
    //     print(newPosition.latitude);
    //     print(newPosition.longitude);
    //   }),
    // ),
    // );

    markRef.once().then((DataSnapshot snapshot){

        markerData = snapshot.value;
        // print(markerData["medical"]);
        // print("LOLOL");
        //
        // print(markerData[0]);
        // print(
        //   'BHOSAD'
        // );
        print("SEX");

        markerData.forEach((key, value) {

          List xD = value.toList();
          // catNames = List.generate(xD.length, (index) => xD[index]);
          // print(xD);
          xD.forEach((element) {
            // print(element['name']);
            // print(element['category']);
            //
            // print(element['lat']);
            // print(element['lon']);
            // print('\n');
            allMarkers.add(Marker(
              markerId: MarkerId(element['name']),
              draggable: false,
              onTap: () {
                print(element['name']);
                launch(element['launch']);
              },
              infoWindow: InfoWindow(
                  title: element['name'],
                  snippet: element['category']),
              position: LatLng(element['lat'], element['lon']),
              // onDragEnd: ((newPosition) {
              //   print(newPosition.latitude);
              //   print(newPosition.longitude);
              // }),
            ),
            );
          });
        });
        print(allMarkers);
        allMarkers.add(Marker(
          markerId: MarkerId('MIT'),
          draggable: true,
          onTap: () {
            // print("Marker Tapped");
            launch('https://goo.gl/maps/gL6cVK9iQvzNiJkQ8');
          },
          infoWindow: InfoWindow(
              title: "MAHE, MIT Manipal",
              snippet: "Manipal Academy of Higher Education"),
          position: LatLng(13.353698208659731, 74.78478820836084),

          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
        ),
        );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text("Map View"),
      ),
      body: FutureBuilder(
          future: ref.once(),
          builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
            return Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [

                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                      // DraggableScrollableSheet(
                      //     initialChildSize: 0.35,
                      //     minChildSize: 0.12,
                      //     maxChildSize: 0.7,
                      //     builder: (context,scrollController){
                      //       return Container(
                      //         decoration: BoxDecoration(
                      //           color: Colors.black,
                      //         ),
                      //
                      //         child: SingleChildScrollView(
                      //           controller: scrollController,
                      //           child: Container(
                      //             padding: EdgeInsets.fromLTRB(10, 50, 10, 10),
                      //             child:  Wrap(
                      //               spacing: 10,
                      //                   // children:,
                      //                     // Chip(
                                          //   label: Text("LOLOLOL"),
                                          //   avatar: CircleAvatar(
                                          //     child: Text("1"),
                                          //   ),
                                          // ),
                                          // Chip(
                                          //   label: Text("LOLOLOL"),
                                          //   avatar: CircleAvatar(
                                          //     child: Text("1"),
                                          //   ),
                                          // ),
                                          // Chip(
                                          //   label: Text("LOLOLOL"),
                                          //   avatar: CircleAvatar(
                                          //     child: Text("1"),
                                          //   ),
                                          // ),
                                          // Chip(
                                          //   label: Text("LOLOLOL"),
                                          //   avatar: CircleAvatar(
                                          //     child: Text("1"),
                                          //   ),
                                          // ),Chip(
                                          //   label: Text("LOLOLOL"),
                                          //   avatar: CircleAvatar(
                                          //     child: Text("1"),
                                          //   ),
                                          // ),

                          //         ),
                          //       ),
                          //     ),
                          //   );
                          // },

                          // builder: (context, scrollController) {
                          //   if (snapshot.hasData) {
                          //     values = snapshot.data.value;
                          //     return Container(
                          //       padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          //       decoration: BoxDecoration(
                          //         color: Colors.black.withOpacity(0.9),
                          //       ),
                          //       child: new ListView(
                          //           controller: scrollController,
                          //           children: values["Categories"][widget
                          //               .subCat]
                          //               .map<Widget>((document) {
                          //             return Card(
                          //               margin: EdgeInsets.fromLTRB(
                          //                   10, 0, 10, 20),
                          //               child: InkWell(
                          //                 onTap: () {
                          //                   print("sex");
                          //                 },
                          //                 child: new ListTile(
                          //
                          //                   title: new Text(document['name']),
                          //                   subtitle: new Text(
                          //                       document['contact'].toString()),
                          //                 ),
                          //               ),
                          //             );
                          //           }).toList()),
                          //     );
                          //   } else {
                          //     return CircularProgressIndicator();
                          //   }
                          // },
                      // ),

                    ],
                  ),
                ),
              ],
            );
          }

      ),
    );
  }
}