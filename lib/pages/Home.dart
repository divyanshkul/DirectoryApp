import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manipal Directory"),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        color: Colors.redAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            Text(
                "Something",
              style: TextStyle(
                fontSize: 50
              ),
            ),
          ],
        ),

      ),

    bottomNavigationBar: CurvedNavigationBar(
      color: Colors.white,
      backgroundColor: Colors.redAccent,
      buttonBackgroundColor: Colors.white,
      index: 0,
      height: 50,
      items: <Widget> [
        Icon(Icons.contacts, size: 30, color: Colors.black,),
        Icon(Icons.map_outlined, size: 30, color: Colors.black,),
        Icon(Icons.chat, size: 30, color: Colors.black,)
      ],
      onTap: (index){
        print("Curent index is $index ");
        
      },
    ),
    );
  }
}
