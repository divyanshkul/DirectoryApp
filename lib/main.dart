import 'package:directory_app/pages/Subpage.dart';
import 'package:flutter/material.dart';
import 'package:directory_app/pages/Chat.dart';
import 'package:directory_app/pages/Home.dart';
import 'package:directory_app/pages/Locate.dart';
import 'package:firebase_core/firebase_core.dart';

// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:directory_app/pages/Welcome.dart';

import 'package:directory_app/pages/Welcome.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';

// import 'package:directory_app/pages/Subpage.dart';
// import 'package:directory_app/pages/SubpageMap.dart';
 import 'package:directory_app/pages/loading.dart';


//void main() => runApp(MyApp());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(DirectoryApp());
}

class DirectoryApp extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/Subpage',
      routes: {
        '/Welcome': (context) => Welcome(),
        '/Home': (context) => Home(),
        '/Chat': (context) => Chat(),
        // '/SubpageMap': (context) => SubpageMap(),
        '/Locate': (context) => Locate(),
        '/Subpage': (context) => Subpage(),
        '/loading': (context) => Loading(),
        //base class what opens  in the beginnering, context means abhi ya hai
      },
    );
  }
}
/**/


