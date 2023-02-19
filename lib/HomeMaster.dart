import 'package:dolibarr/DashboardMaster.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'GridDashboard.dart';

class HomeMaster extends StatefulWidget {
  const HomeMaster({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<HomeMaster> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 45,
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
                      "Acceuil :)",
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
                      "Bienvenue !",
                      style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                              color: Color.fromARGB(228, 33, 149, 243),
                              fontSize: 20,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          DashboardMaster()
        ],
      ),
    );
  }
}
