import 'package:directory_app/pages/SubpageTest.dart';
import 'package:directory_app/pages/Subpage.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CardData extends StatelessWidget {
  Items item1 = new Items(
      title: "Medical",
      img: "assets/medical.png",
      requiresMap: true,
      iconColor: Colors.red,
      name: "medical");

  Items item2 = new Items(
      title: "Mess",
      requiresMap: false,
      img: "assets/mess.png",
      iconColor: Colors.yellow,
      name: "Mess"
  );

  Items item3 = new Items(
      title: "Groceries",
      requiresMap: true,
      img: "assets/groceries.png",
      iconColor: Colors.red,
      name: "Grocery Stores"
  );

  Items item4 = new Items(
      title: "MIT Departments",
      //img: Icons.add,
      img: "assets/mit.png",
      requiresMap: false,
      iconColor: Colors.red,
      name: "Departments"
  );

  Items item5 = new Items(
      title: "MAHE Departments",
      //img: Icons.add,
      img: "assets/mahe.png",
      requiresMap: true,
      iconColor: Colors.red,
      name: "Mahe College Departments"
  );

  Items item6 = new Items(
      title: "Emergency",
      //img: Icons.add,
      img: "assets/medical1.png",
      requiresMap: false,
      iconColor: Colors.red,
      name: "Emergency Contacts"
  );

  Items item7 = new Items(
      title: "Eateries",
      //img: Icons.add,
      img: "assets/eateries.png",
      requiresMap: true,
      iconColor: Colors.red,
      name: "Eateries"
  );

  Items item8 = new Items(
      title: "Misc. Services",
      //img: Icons.add,
      img: "assets/medical.png",
      requiresMap: true,
      iconColor: Colors.red,
      name: "Miscellaneous Services"
  );


  Items item9 = new Items(
      title: "Tech Stores",
      //img: Icons.add,
      img: "assets/tech.png",
      requiresMap: true,
      iconColor: Colors.red,
      name: "Project Work and tech stores"
  );


  Items item10 = new Items(
      title: "Rent a Bike",
      //img: Icons.add,
      img: "assets/bike.png",
      requiresMap: true,
      iconColor: Colors.red,
      name: "Rent a bike"
  );


  Items item11 = new Items(
      title: "Hotels",
      //img: Icons.add,
      img: "assets/hotel.png",
      requiresMap: true,
      iconColor: Colors.red,
      name: "hotel"
  );

  Items item12 = new Items(
      title: "Travel Agencies",
      //img: Icons.add,
      img: "assets/travel.png",
      requiresMap: true,
      iconColor: Colors.red,
      name: "Travel Agencies"
  );

  Items item13 = new Items(
      title: "Auto",
      //img: Icons.add,
      img: "assets/auto.png",
      requiresMap: true,
      iconColor: Colors.red,
      name: "auto"
  );

  @override
  Widget build(BuildContext context) {
    List<Items> listOfItems = [item1, item2, item3, item4, item13, item6, item5, item7, item8, item9, item10, item11, item12];
    var color = 0x54123b;
    return Flexible(
      child: GridView.count(
          padding: EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: listOfItems.map((data) {
            return InkWell(
              highlightColor: Colors.orange,
                onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SubpageTest(subCat: data.name)),
                );
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
                        offset: Offset(3, 3),
                        color: Colors.grey[800])
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      data.img,
                      height: 120,
                    ),
                    Text(data.title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600)),
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
