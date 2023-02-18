import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  final String nom;
  final String prenom;
  final String identifiant;
  final String adresse;

  const UserProfilePage({
    Key? key,
    required this.nom,
    required this.prenom,
    required this.identifiant,
    required this.adresse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
        Row(

        ),
      ),
        );
  }
}
