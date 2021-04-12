import 'package:flutter/material.dart';
import 'package:directory_app/pages/loading.dart';
import 'package:directory_app/pages/Home.dart';


void main() => runApp(MaterialApp(
  initialRoute: '/home',
  routes: {
    '/home': (context) => Home(),
    '/loading': (context) => Loading()

  },
));
