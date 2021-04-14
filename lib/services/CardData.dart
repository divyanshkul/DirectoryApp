
import 'package:directory_app/pages/SubpageTest.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CardData extends StatelessWidget {
  Items item1 = new Items(
      title: "Medical Emergencies",
      img: "assets/medical1.png",
      requiresMap: true,
      iconColor: Colors.red,
      name: "Departments"
  );

  Items item2 = new Items(
    title: "2",
    //img: Icons.add,
    requiresMap: false,
    img: "assets/medical.png",

    iconColor: Colors.yellow,
      name: "Eateries"

  );
  Items item3 = new Items(
    title: "3",
    //i/mg: Icons.add,
    requiresMap: true,      img: "assets/medical.png",

    iconColor: Colors.red,
      name: "auto"


  );
  Items item4 = new Items(
    title: "4",
    //img: Icons.add,
    img: "assets/medical.png",

    requiresMap: false,
    iconColor: Colors.red,name: "auto"



  );
  Items item5 = new Items(
    title: "4",
    //img: Icons.add,
    img: "assets/medical.png",

    requiresMap: true,      iconColor: Colors.red,name: "auto"



  );
  Items item6 = new Items(
    title: "5",
    //img: Icons.add,
    img: "assets/medical.png",

    requiresMap: false,      iconColor: Colors.red,name: "auto"



  );
  Items item7 = new Items(
    title: "6",
    //img: Icons.add,
    img: "assets/medical.png",

    requiresMap: true,      iconColor: Colors.red,name: "auto"


  );

  @override
  Widget build(BuildContext context) {
    List<Items> listOfItems = [item1, item2, item3, item4, item5, item6, item7];
    var color = 0x54123b;
    return Flexible(
      child: GridView.count(
          padding: EdgeInsets.only(left: 10, right: 10,),

          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: listOfItems.map((data) {
            return InkWell(
              highlightColor: Colors.orange,
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SubpageTest(subCat: data.name)), );
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                decoration: BoxDecoration(
                    color: HexColor("#3c415c"),
                    
                    borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 1.0, // soften the shadow
                      spreadRadius: 0.5, //extend the shadow
                      offset: Offset(3,3),
                      color: Colors.grey[800]
                    )
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      data.img,
                      height: 120,
                    ),
                    Text(
                      data.title,

                      style:TextStyle(
                              color: Colors.white,
                              fontSize: 18,

                              fontWeight: FontWeight.w600)
                    ),
                  ],
                ),
              ),
            );
          }).toList()),
    );
  }
}

class Items {
  String title;
  //String itemCount;
  String img;
  bool requiresMap;
  var iconColor;
  String name;
  Items({this.title, this.img, this.requiresMap, this.iconColor, this.name});
}
