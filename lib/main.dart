import 'package:flutter/material.dart';
import 'package:dolibarr/creer_users';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  String value = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Utilisateurs',
      home: maryam(),
      theme: ThemeData(primarySwatch: Colors.purple),
    );
  }
}
