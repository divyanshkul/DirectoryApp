import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manipal Directory"),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
      ),
      backgroundColor: Colors.pink,
      body: Center(
        child: Container(
          child: Text(
            "THIS IS CHAT PAGE",

          ),
        ),
      ),
    );
  }
}