
import 'package:flutter/material.dart';

class CardData extends StatelessWidget {
  Items item1 = new Items(
      title: "1",
      img: Icons.medical_services,
      requiresMap: true,
  );

  Items item2 = new Items(
    title: "2",
    img: Icons.add,
    requiresMap: false,
  );
  Items item3 = new Items(
    title: "3",
    img: Icons.add,
    requiresMap: true,

  );
  Items item4 = new Items(
    title: "4",
    img: Icons.add,
    requiresMap: false,

  );
  Items item5 = new Items(
    title: "4",
    img: Icons.add,
    requiresMap: true,

  );
  Items item6 = new Items(
    title: "5",
    img: Icons.add,
    requiresMap: false,

  );
  Items item7 = new Items(
    title: "6",
    img: Icons.add,
    requiresMap: true,
  );

  @override
  Widget build(BuildContext context) {
    List<Items> listOfItems = [item1, item2, item3, item4, item5, item6, item7];
    var color = 0xff453658;
    return Flexible(
      child: GridView.count(
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: listOfItems.map((data) {
            return InkWell(
              onTap: (){
                print("Container ${data.title} clicked");
                if(data.requiresMap){
                  print("Hello divyansh");
                }
                else{
                  print("Hello anushka");
                }
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Color(color),
                    borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2.0, // soften the shadow
                      spreadRadius: 0.1, //extend the shadow
                      offset: Offset(3,3),
                    )
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      data.img,
                      size: 40,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      data.title,
                      style:TextStyle(
                              color: Colors.white,
                              fontSize: 16,
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
  var img;
  bool requiresMap;
  Items({this.title, this.img, this.requiresMap});
}
