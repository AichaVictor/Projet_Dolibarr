import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  Details({Key? key, required this.productName}) : super(key: key);

  String productName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste des produits"),
        backgroundColor: Color(0xff453658),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Container(
        padding: EdgeInsets.all(21.0),
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.account_balance_wallet_outlined),
              title: Text(productName),
            )
          ],
        ),
      ),
    );
  }
}
