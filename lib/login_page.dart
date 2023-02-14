import 'package:dolibarr/main.dart';
import 'package:flutter/material.dart';
 
class login_page extends StatelessWidget  {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center (
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ 
            const Icon(Icons.phone_android_rounded,
            size: 100,
            ),
            const SizedBox(height: 75),


            // Hello ! 
        const Text(
          'Hello !',
          style: TextStyle(
            fontWeight: FontWeight.bold, 
          fontSize: 36,
          ),
          ),
      const SizedBox(height: 10),
       const  Text(
           'Wecome!',
          style: TextStyle( 
          fontSize: 20,
          ),
          ),
        const SizedBox(height: 50),

        // Identifiant textfield
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child : Container(
           decoration: BoxDecoration(
            color: Colors.grey[200],
            border:Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Padding (
            padding:  EdgeInsets.only(left: 20.0),
            child: TextField(
           decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Identifiant',
        ),
        ),
        ),
        ),
        ),
        const SizedBox(height: 10),


        // Mot de Passe textfield 
          Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child : Container(
           decoration: BoxDecoration(
            color: Colors.grey[200],
            border:Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Padding (
            padding: EdgeInsets.only(left: 20.0),
            child: TextField(
              obscureText: true,
           decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Mot de Passe',
        ),
        ),
        ),
        ),
        ),
       const  SizedBox(height: 10),


        // Se connecter
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Container(
            padding:const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(12),
              ),
            child: Center(
              child: Text(
                'Se connecter',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  ),
                ),
        ),
        ),
        ),
        SizedBox(height: 10),

        // Mot de Passe oublié ? -Besoin d'assistance ou aide ?
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Text('Mot de Passe oublié ? ',
           style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
           ),
           ),
           Text(
            '-Besoin assistance',
           style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
           ),
           ),
           Text('ou aide',
           style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
           ),
           ),
          ],
        ),  
        ],
      ),
    ),
    ),
    );
  }
}