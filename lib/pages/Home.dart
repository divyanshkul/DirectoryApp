import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:directory_app/pages/Locate.dart';
import 'package:directory_app/pages/Chat.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedPage = 0;
  final pageOptions = [Home(), Locate(), Chat()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manipal Directory"),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
      ),
      body:
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        color: Colors.redAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            Text(
                "Something",
            ),
          ],
        ),

      ),


    );
  }
}
