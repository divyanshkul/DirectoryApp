import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
class SubpageMap extends StatefulWidget {
  @override
  _SubpageMapState createState() => _SubpageMapState();
}

class _SubpageMapState extends State<SubpageMap> {
  // Reading from firebase
//final dbRef = FirebaseDatabase.instance.reference().child("medical");

// return FutureBuilder(
// future: dbRef.once(),
// builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
// if (snapshot.hasData) {
//
// Map<dynamic, dynamic> values = snapshot.data.value;
// print(snapshot.data.value);
//
// }  
// return CircularProgressIndicator();
// });
//
Query dbRef;
 Map<dynamic, dynamic> values ;
//final dbRef = FirebaseDatabase.instance.reference().child("Categories");
@override
  void initState() {
    // TODO: implement initState
    dbRef = FirebaseDatabase.instance.reference()
      .child("Categories");
    super.initState();
  }
  // //List<Map <dynamic, dynamic>> lists = [];
  // Map<dynamic, dynamic> values = snapshot.value;
  // values.forEach((key,values) {
  // print(values["name"]);
  // });
  // });
  @override
  Widget build(BuildContext context) {

      return Scaffold(

        body: FutureBuilder(
            future: dbRef.once(),
            builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
              if (snapshot.hasData) {
                values = snapshot.data.value;
                values.forEach((key, value) {
                  print(values["Departments"]["Biomtechnology"]);
                });
              }
              return Container(
                child: SafeArea(
                  child: ListTile(
                    leading: Icon(Icons.import_contacts_sharp),
                    
                    title: Text(
                     "Divyansh"
                    ),
                    subtitle: Text(values["Departments"]["Biomtechnology"]["contact"].toString()),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    // onTap: () {
                    //   setState(() {
                    //     print(values["Departments"]["Biomtechnology"]);
                    //   });
                    //
                    // },
                  ),
                ),
              );
            }),
      );
    }
  }

