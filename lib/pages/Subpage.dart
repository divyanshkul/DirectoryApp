import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class Subpage extends StatefulWidget {
  @override
  _SubpageState createState() => _SubpageState();
}

class _SubpageState extends State<Subpage> {
  // final _auth = FirebaseAuth.instance;
  final testRef = FirebaseDatabase.instance.reference().child("test");


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        panelBuilder: (scrollController) => buildSlidingPanel(
          scrollController: scrollController,
        ),
        body: Stack(

          children: [
            GoogleMap(
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: true,
              initialCameraPosition:
                  CameraPosition(target: LatLng(24.142, -110.321), zoom: 15),
            ),
          ],
        ),
      ),
    );

  }

  Widget buildSlidingPanel({
    @required ScrollController scrollController,
  }) => Container(
    child: Text("TEXT lmao"),

  );
}
