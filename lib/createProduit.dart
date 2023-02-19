// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'produitcree.dart';

class FormulaireProduit extends StatefulWidget {
  const FormulaireProduit({Key? key}) : super(key: key);

  @override
  State<FormulaireProduit> createState() => _FormulaireProduitState();
}

class _FormulaireProduitState extends State<FormulaireProduit> {
  final formKey = GlobalKey<FormState>();
  final RefController = TextEditingController();
  final libelleController = TextEditingController();
  final EtatController = TextEditingController();
  final DescriptionController = TextEditingController();
  final PrixController = TextEditingController();
  final limiteStockController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    RefController.dispose();
    libelleController.dispose();
    EtatController.dispose();
    DescriptionController.dispose();
    PrixController.dispose();
    limiteStockController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nouveau produit"),
        backgroundColor: Color(0xff453658),
      ),
      body: Form(
          key: formKey,
          child: ListView(children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 45.0, left: 18.0, right: 18.0, bottom: 8.0),
              child: TextFormField(
                  cursorColor: Colors.blue,
                  controller: RefController,
                  decoration: const InputDecoration(
                      labelText: 'Référence',
                      hintStyle: TextStyle(color: Color(0xff453658)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      labelStyle: TextStyle(
                        color: Colors.black,
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuiller saisir la reference';
                    }
                    return null;
                  }),
            ),
            Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, left: 18.0, right: 18.0, bottom: 8.0),
                child: TextFormField(
                  cursorColor: Colors.blue,
                  controller: libelleController,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                      labelText: 'Libellé',
                      hintStyle: const TextStyle(color: Color(0xff453658)),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      labelStyle: const TextStyle(
                        color: Colors.black,
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuiller saisir le libelle';
                    }
                    return null;
                  },
                )),
            Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, left: 18.0, right: 18.0, bottom: 8.0),
                child: TextFormField(
                    cursorColor: Colors.blue,
                    controller: EtatController,
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                        labelText: 'Etat',
                        hintText: 'Vente ou Achat',
                        hintStyle: const TextStyle(color: Color(0xff453658)),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        labelStyle: const TextStyle(
                          color: Colors.black,
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuiller indiquer l_etat du produit';
                      }
                      return null;
                    })),
            Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, left: 18.0, right: 18.0, bottom: 8.0),
                child: TextFormField(
                    cursorColor: Colors.blue,
                    controller: limiteStockController,
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                        labelText: 'Limite du stock (alerte)',
                        hintStyle: const TextStyle(color: Color(0xff453658)),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        labelStyle: const TextStyle(
                          color: Colors.black,
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuiller indiquer la limite du stock';
                      }
                      return null;
                    })),
            Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, left: 18.0, right: 18.0, bottom: 8.0),
              child: TextFormField(
                  cursorColor: Colors.blue,
                  controller: PrixController,
                  decoration: const InputDecoration(
                      labelText: 'Prix',
                      hintStyle: TextStyle(color: Color(0xff453658)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      labelStyle: TextStyle(
                        color: Colors.black,
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuiller indiquer le prix';
                    }
                    return null;
                  }),
            ),
            Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, left: 18.0, right: 18.0, bottom: 8.0),
                child: TextFormField(
                  cursorColor: Colors.blue,
                  controller: DescriptionController,
                  decoration: const InputDecoration(
                      labelText: 'Description',
                      hintStyle: TextStyle(color: Color(0xff453658)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      labelStyle: TextStyle(
                        color: Colors.black,
                      )),
                  keyboardType: TextInputType.multiline,
                  minLines: 3,
                  maxLines: 5,
                )),
            const SizedBox(height: 8.0),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Details(
                        productName: RefController.text,
                      );
                    }));
                  }
                },
                child: const Text('Creer'),
              ),
            ),
            const SizedBox(height: 8.0),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff453658),
                ),
                onPressed: () {},
                child: const Text('Annuler'),
              ),
            ),
          ])), //form
    );
  }
}
