import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:directory_app/pages/Locate.dart';
import 'package:directory_app/pages/Chat.dart';
import 'package:directory_app/services/CardData.dart';


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
      backgroundColor: Colors.grey[800],
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[

                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "Directory",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: Colors.grey[200],
              thickness: 0.3,
            ),
            CardData()
          ],
        ),
      ),
    );
  }
}
