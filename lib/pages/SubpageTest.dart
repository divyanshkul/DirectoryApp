import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class SubpageTest extends StatefulWidget {
  final String subCat;
  SubpageTest({Key key, @required this.subCat}) : super(key: key);
  @override
  _SubpageTestState createState() => _SubpageTestState();


}

class _SubpageTestState extends State<SubpageTest> {
  Query ref;
  Map<dynamic, dynamic> values;



  @override
  void initState() {
    // TODO: implement initState
    ref = FirebaseDatabase.instance.reference().child('Categories').parent();
    super.initState();
  }

  // Widget buildCategories({Map categories}) {
  //   //print(categories['Departments']);
  //   return Container(
  //       child: SafeArea(
  //           child: ListTile(
  //             leading: Icon(Icons.import_contacts_sharp),
  //             title: Text(
  //               categories[widget.subCat][0]["contact"].toString(),
  //               style: TextStyle(
  //                 fontSize: 16,
  //               ),
  //             ),
  //             subtitle: Text("Hello"),
  //             trailing: Icon(Icons.keyboard_arrow_right),
  //           )
  //       )
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: ref.once(),
            builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
              if (snapshot.hasData) {
                values = snapshot.data.value;
                return new ListView(
                    children: values["Categories"][widget.subCat].map<Widget>((document) {
                    return Card(
                      child: InkWell(
                        onTap: (){
                          print("sex");
                        },
                        child: new ListTile(
                        title: new Text(document['name']),
                        subtitle: new Text("Classs"),
                  ),
                      ),
                    );
                }).toList()
                );
                // values.forEach((key, value) {
                //   print(values["Categories"]["Departments"][0]["name"]);
                // });
              }
              else{
                return CircularProgressIndicator();
              }

              //return buildCategories(categories: values);

            }
        )
    );
  }
}