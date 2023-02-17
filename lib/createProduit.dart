// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class FormulaireProduit extends StatefulWidget {
  const FormulaireProduit({Key? key}) : super(key: key);

  @override
  State<FormulaireProduit> createState() => _FormulaireProduitState();
}

class _FormulaireProduitState extends State<FormulaireProduit> {
  final formKey = GlobalKey<FormState>();
  final RefController = TextEditingController();
  final libelleController = TextEditingController();
  final EtatVenteController = TextEditingController();
  final EtatAchatController = TextEditingController();
  final DescriptionController = TextEditingController();
  final PrixController = TextEditingController();
  final limiteStockController = TextEditingController();
  final natureProduitController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    RefController.dispose();
    libelleController.dispose();
    EtatVenteController.dispose();
    EtatAchatController.dispose();
    DescriptionController.dispose();
    PrixController.dispose();
    limiteStockController.dispose();
    natureProduitController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nouveau produit"),
        backgroundColor: Color.fromARGB(255, 97, 37, 78),
      ),
      body: Form(
          key: formKey,
          child: ListView(children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 45.0, left: 18.0, right: 18.0, bottom: 8.0),
              child: TextFormField(
                  cursorColor: Color.fromARGB(255, 223, 29, 126),
                  controller: RefController,
                  decoration: const InputDecoration(
                      labelText: 'Référence',
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 97, 37, 78)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 223, 29, 126)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 223, 29, 126)),
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
                  cursorColor: const Color.fromARGB(255, 223, 29, 126),
                  controller: libelleController,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                      labelText: 'Libellé',
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 97, 37, 78)),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 223, 29, 126)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 223, 29, 126)),
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
                    cursorColor: const Color.fromARGB(255, 223, 29, 126),
                    controller: limiteStockController,
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                        labelText: 'Limite du stock (alerte)',
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 97, 37, 78)),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 223, 29, 126)),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 223, 29, 126)),
                        ),
                        labelStyle: const TextStyle(
                          color: Colors.black,
                        )))),
            Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, left: 18.0, right: 18.0, bottom: 8.0),
              child: TextFormField(
                  cursorColor: const Color.fromARGB(255, 223, 29, 126),
                  controller: PrixController,
                  decoration: const InputDecoration(
                      labelText: 'Prix',
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 97, 37, 78)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 223, 29, 126)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 223, 29, 126)),
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
                  cursorColor: const Color.fromARGB(255, 223, 29, 126),
                  controller: DescriptionController,
                  decoration: const InputDecoration(
                      labelText: 'Description',
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 97, 37, 78)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 223, 29, 126)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 223, 29, 126)),
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
                  backgroundColor: const Color.fromARGB(255, 223, 29, 126),
                ),
                onPressed: () {},
                child: const Text('Creer'),
              ),
            ),
            const SizedBox(height: 8.0),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 97, 37, 78),
                ),
                onPressed: () {},
                child: const Text('Annuler'),
              ),
            ),
          ])), //form
    );
  }
}
