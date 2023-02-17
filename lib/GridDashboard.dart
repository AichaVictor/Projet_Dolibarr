import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'createProduit.dart';
import 'listeProduct.dart';
import 'stockProduct.dart';
import 'statsProduct.dart';

class GridDashboard extends StatelessWidget {
  late Items item1 = Items(
      title: "Nouveau produit",
      subtitle: "Cliquez pour ajouter",
      event: "",
      img: "assets/newproduct.png");

  Items item2 = Items(
    title: "Liste",
    subtitle: "Cliquez pour consulter",
    event: "",
    img: "assets/liste.png",
  );
  Items item3 = Items(
    title: "Stocks",
    subtitle: "Cliquez pour consulter",
    event: "",
    img: "assets/stock.png",
  );
  Items item4 = Items(
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
          padding: const EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return InkWell(
              onTap: () {
                if (data.img == "assets/newproduct.png") {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FormulaireProduit()));
                } else if (data.img == "assets/liste.png") {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FormulaireProduit()));
                } else if (data.img == "assets/stock.png") {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FormulaireProduit()));
                } else if (data.img == "assets/stat.png") {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FormulaireProduit()));
                }
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Color(color),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      data.img,
                      width: 88,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Text(
                      data.title,
                      style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.w600)),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      data.subtitle,
                      style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                              color: Colors.white38,
                              fontSize: 15,
                              fontWeight: FontWeight.w600)),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      data.event,
                      style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                              color: Colors.white70,
                              fontSize: 11,
                              fontWeight: FontWeight.w600)),
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
  String subtitle;
  String event;
  String img;
  Items(
      {required this.title,
      required this.subtitle,
      required this.event,
      required this.img});
}
