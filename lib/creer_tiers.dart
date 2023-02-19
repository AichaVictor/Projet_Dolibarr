import 'package:flutter/material.dart';

class CreerTiers extends StatefulWidget {
  const CreerTiers({Key? key}) : super(key: key);

  @override
  State<CreerTiers> createState() => _CreerTiersState();
}

class _CreerTiersState extends State<CreerTiers> {
  final formKey = GlobalKey<FormState>();
  final nomTiersController = TextEditingController();
  final adresseController = TextEditingController();
  final codeController = TextEditingController();
  final villeController = TextEditingController();
  final telController = TextEditingController();
  final emailController = TextEditingController();
  String select = 'a';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title:  Text("Nouveau tiers"),
        backgroundColor : Colors.purple,
    ),
      body: Form(
    key: formKey,
    child: ListView(children: [
    Padding(
    padding: const EdgeInsets.only(
    top: 45.0, left: 18.0, right: 18.0, bottom: 8.0),
    child: TextFormField(
    controller: nomTiersController,
    decoration:  InputDecoration(
    labelText: 'Nom du tiers',
    border: OutlineInputBorder(
    borderRadius:
    BorderRadius.all(Radius.circular(20.0)),)),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Le nom du tiers est obligatoire';
          }
          return null;
        }),
    ),

        Padding(
            padding: const EdgeInsets.only(
                top: 16.0, left: 18.0, right: 18.0, bottom: 8.0),
            child: TextFormField(
                controller: adresseController,
                decoration:  InputDecoration(
                    labelText: 'Adresse',
                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(20.0)),)),
                      keyboardType: TextInputType.multiline,
                      minLines: 2,
                      maxLines: 3,
            )
        ),
      Padding(
        padding: const EdgeInsets.only(
            top: 16.0, left: 18.0, right: 18.0, bottom: 8.0) ,
        child: DropdownButtonFormField(
            items: [
              DropdownMenuItem(value: "a" ,child: Text("Prospect")),
              DropdownMenuItem(value: "b" ,child: Text("Client")),
              DropdownMenuItem(value: "c" ,child: Text("Prospect / Client")),
              DropdownMenuItem(value: "d" ,child: Text("Ni Prospect ni Client"))
            ],
            decoration: InputDecoration(
                labelText: 'Prospect ou Client',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))
                )),
            value: select,
            onChanged: (value){
              setState(() {
                select = value!;

              });
            },
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(
            top: 16.0, left: 18.0, right: 18.0, bottom: 8.0),
        child: TextFormField(
            controller: codeController,
            decoration:  InputDecoration(
                labelText: 'Code postal',
                border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.all(Radius.circular(20.0)),)),
           ),
      ),
      Padding(
        padding: const EdgeInsets.only(
            top: 16.0, left: 18.0, right: 18.0, bottom: 8.0),
        child: TextFormField(
          controller: villeController,
          decoration:  InputDecoration(
              labelText: 'Ville',
              border: OutlineInputBorder(
                borderRadius:
                BorderRadius.all(Radius.circular(20.0)),)),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(
            top: 16.0, left: 18.0, right: 18.0, bottom: 8.0),
        child: TextFormField(
          controller: telController,
          decoration:  InputDecoration(
              labelText: 'Telephone',
              border: OutlineInputBorder(
                borderRadius:
                BorderRadius.all(Radius.circular(20.0)),)),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(
            top: 16.0, left: 18.0, right: 18.0, bottom: 8.0),
        child: TextFormField(
          controller: emailController,
          decoration:  InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(
                borderRadius:
                BorderRadius.all(Radius.circular(20.0)),)),
        ),
      ),
        SizedBox(height: 8.0),
        Center(
          child: ElevatedButton(
          onPressed: () async {
            if(formKey.currentState!.validate()){

             }
         },
              child: Text('Creer'),
        ),
        ),
      SizedBox(height: 8.0),
      Center(
        child: ElevatedButton(
          onPressed: () {},
          child: Text('Annuler'),
        ),
      )
    ]
    )
    )
    );
  }
}
