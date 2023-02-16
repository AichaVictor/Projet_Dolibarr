import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'GridDashboard.dart';

import 'createProduit.dart';

class HomeProduct extends StatefulWidget {
  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<HomeProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 110,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Produits",
                      style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                              color: Color.fromARGB(255, 97, 37, 78),
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Espace Produits",
                      style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                              color: Color.fromARGB(234, 123, 168, 228),
                              fontSize: 20,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
                IconButton(
                  iconSize: 30,
                  alignment: Alignment.topCenter,
                  icon: Image.asset(
                    "assets/message.png",
                    width: 800,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GridDashboard()
        ],
      ),
    );
  }
}
