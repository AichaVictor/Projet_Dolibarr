import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GridDashboard extends StatelessWidget {
  late Items item1 = new Items(
      title: "Nouveau produit",
      subtitle: "Cliquez pour ajouter",
      event: "",
      img: "assets/newproduct.png");

  Items item2 = new Items(
    title: "Liste",
    subtitle: "Cliquez pour consulter",
    event: "",
    img: "assets/liste.png",
  );
  Items item3 = new Items(
    title: "Stocks",
    subtitle: "Cliquez pour consulter",
    event: "",
    img: "assets/stock.png",
  );
  Items item4 = new Items(
    title: "Statistiques",
    subtitle: "Cliquez pour consulter",
    event: "",
    img: "assets/stat.png",
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4];
    var color = 0xff453658;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return Container(
              decoration: BoxDecoration(
                  color: Color(color), borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    data.img,
                    width: 88,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    data.title,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    data.subtitle,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.white38,
                            fontSize: 15,
                            fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    data.event,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.white70,
                            fontSize: 11,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            );
          }).toList()),
    );
  }
}

class Items {
  String title;
  String subtitle;
  String event;
  String img;
  Items(
      {required this.title,
      required this.subtitle,
      required this.event,
      required this.img});
}