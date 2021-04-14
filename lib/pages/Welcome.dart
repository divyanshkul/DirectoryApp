import 'package:directory_app/pages/Subpage.dart';
import 'package:flutter/material.dart';

import 'package:directory_app/pages/Chat.dart';
import 'package:directory_app/pages/Home.dart';
import 'package:directory_app/pages/Locate.dart';
import 'package:directory_app/pages/loading.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:directory_app/pages/Welcome.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  int selectedpage = 0; //initial value

  final _pageOptions = [Home(), Subpage(subCat: 'Eateries')]; // listing of all 3 pages index wise

  final bgcolor = [Colors.deepPurple, Colors.deepPurple];  // changing color as per active index value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[selectedpage], // initial value is 0 so HomePage will be shown
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        buttonBackgroundColor: Colors.white,
        backgroundColor: bgcolor[selectedpage],
        color: Colors.black,
        animationCurve: Curves.linearToEaseOut,
        items: <Widget>[
          Icon(
            Icons.contacts,
            size: 30,
            color: Colors.deepPurple,
          ),
          Icon(
            Icons.map,
            size: 30,
            color: Colors.deepPurple,
          )
        ],
        onTap: (index) {
          setState(() {
            selectedpage = index;  // changing selected page as per bar index selected by the user
          });
        },
      ),
    );
  }
}
