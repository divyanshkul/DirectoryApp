import 'package:flutter/material.dart';
import 'package:directory_app/pages/Chat.dart';
import 'package:directory_app/pages/Home.dart';
import 'package:directory_app/pages/Locate.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';


void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Manipal Directory',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {

  int selectedpage = 0; //initial value

  final _pageOptions = [Home(), Locate(), Chat()]; // listing of all 3 pages index wise

  final bgcolor = [Colors.deepOrange, Colors.orange, Colors.pink];  // changing color as per active index value

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
            color: Colors.purple,
          ),
          Icon(
            Icons.map,
            size: 30,
            color: Colors.purple,
          ),
          Icon(
            Icons.chat_bubble,
            size: 30,
            color: Colors.purple,
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