import 'package:flutter/material.dart';
import 'package:directory_app/pages/loading.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Loading()
  },
));
