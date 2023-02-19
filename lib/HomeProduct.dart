import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'GridDashboard.dart';

class HomeProduct extends StatefulWidget {
  const HomeProduct({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<HomeProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 80,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
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
                              color: Color(0xff453658),
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
                              color: Color.fromARGB(228, 33, 149, 243),
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
