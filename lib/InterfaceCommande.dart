import 'dart:ui';
import '../createCommande.dart';
import 'package:flutter/material.dart';
import '../listerCommande.dart';

class CommandePage extends StatefulWidget {
  @override
  _CommandePageState createState() => _CommandePageState();
}

class _CommandePageState extends State<CommandePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Gestion des commandes',
          style: TextStyle(
            color: Colors.purple.shade900,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple.shade50,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40)),
          side: BorderSide(
              width: 1,
              color: Colors.deepPurple.shade900,
              style: BorderStyle.none
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(25),
          child: SizedBox(),
        ),),
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment(0.2, 0.2),
                    radius: _controller.value * 5,
                    colors: [
                      Color.fromRGBO(221, 160, 221, 1),
                      Color.fromRGBO(250, 230, 250, 1),
                      Color(0xFFE8DAE2),
                      Color(0xFFFFD2E0),
                    ],
                    stops: [0, 0.25, 0.75, 1],
                  ),
                ),
              );
            },
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 16,
                  spreadRadius: 4,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            margin: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                child: Container(
                  padding: EdgeInsets.all(16),
                  color: Colors.white.withOpacity(0.2),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 200,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => CreateCommand()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(108, 48, 130,1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              'Créer une commande',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 35),
                        SizedBox(
                          width: 200,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => HomeCommande()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(108, 48, 130, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              'Lister une commande',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 35),
                        SizedBox(
                          width: 200,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => CreateCommand()),//à modifier
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(108, 48, 130, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              'Revenir en arriere',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
