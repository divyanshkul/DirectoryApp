import 'package:firebase_database/firebase_database.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: ref.once(),
            builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
              if (snapshot.hasData) {
                values = snapshot.data.value;
                return new ListView(
                    children: values["Categories"][widget.subCat]
                        .map<Widget>((document) {
                      return Card(
                        child: InkWell(
                          onTap: () {
                            print("sex");
                          },
                          child: new ListTile(
                            title: new Text(document['name']),
                            subtitle: new Text("Classs"),
                          ),
                        ),
                      );
                    }).toList());
              } else {
                return CircularProgressIndicator();
              }

              //return buildCategories(categories: values);
            }));
  }
}
