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

  Query ref, markRef;
  Map<dynamic, dynamic> values;

  Position currentPosition;
  var geoLocator = Geolocator();
  static const LatLng _center = const LatLng(28.5987135, 77.3181042);
  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  GoogleMapController newGoogleMapController;

  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    LatLng latLngPosition = LatLng(position.latitude, position.longitude);
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
        markerData.forEach((key, value) {

          List xD = value.toList();
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
                // launch('https://goo.gl/maps/8KgH4oNhWxKfgRpn6');
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
        // allMarkers.add(Marker(
        //   markerId: MarkerId('MyMarker'),
        //   draggable: true,
        //   onTap: () {
        //     print("Marker Tapped");
        //   },
        //   infoWindow: InfoWindow(
        //       title: "Vishram Spot 1",
        //       snippet: "One stop for the rest stop"),
        //   position: LatLng(28.6987135, 77.3181042),
        //   onDragEnd: ((newPosition) {
        //     print(newPosition.latitude);
        //     print(newPosition.longitude);
        //   }),
        // ),
        // );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.subCat.toString()),
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
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 85),
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
                          initialChildSize: 0.35,
                          minChildSize: 0.1,
                          maxChildSize: 0.7,

                          builder: (context, scrollController) {
                            if (snapshot.hasData) {
                              values = snapshot.data.value;
                              return Container(
                                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.9),
                                ),
                                child: new ListView(
                                    controller: scrollController,
                                    children: values["Categories"][widget
                                        .subCat]
                                        .map<Widget>((document) {
                                      return Card(
                                        margin: EdgeInsets.fromLTRB(
                                            10, 0, 10, 20),
                                        child: InkWell(
                                          onTap: () {
                                            print("sex");
                                          },
                                          child: new ListTile(

                                            title: new Text(document['name']),
                                            subtitle: new Text(
                                                document['contact'].toString()),
                                          ),
                                        ),
                                      );
                                    }).toList()),
                              );
                            } else {
                              return CircularProgressIndicator();
                            }
                          }),

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