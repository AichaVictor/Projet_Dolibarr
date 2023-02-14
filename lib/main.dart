import 'package:flutter/material.dart';
import '../createCommande.dart';

void main() {
  runApp( MaterialApp(
    home: CreateCommand(),
    theme: ThemeData(primarySwatch: Colors.purple),

  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
    );
  }
}
