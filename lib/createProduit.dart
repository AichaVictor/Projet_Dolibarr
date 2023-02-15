import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';

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
                  decoration: InputDecoration(
                      labelText: 'Référence',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 223, 29, 126)),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0)))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuiller saisir la reference';
                    }
                    return null;
                  }),
            ),
            Padding(
                padding: EdgeInsets.only(
                    top: 16.0, left: 18.0, right: 18.0, bottom: 8.0),
                child: TextFormField(
                  cursorColor: Color.fromARGB(255, 223, 29, 126),
                  controller: libelleController,
                  decoration: InputDecoration(
                      labelText: 'Libellé',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 223, 29, 126)),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0)))),
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
                    cursorColor: Color.fromARGB(255, 223, 29, 126),
                    controller: limiteStockController,
                    decoration: InputDecoration(
                        labelText: 'Limite du stock (alerte)',
                        labelStyle:
                            TextStyle(color: Color.fromARGB(255, 223, 29, 126)),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)))))),
            Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, left: 18.0, right: 18.0, bottom: 8.0),
              child: TextFormField(
                  cursorColor: Color.fromARGB(255, 223, 29, 126),
                  controller: PrixController,
                  decoration: InputDecoration(
                      labelText: 'Prix',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 223, 29, 126)),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0)))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuiller indiquer le prix';
                    }
                    return null;
                  }),
            ),
            Padding(

decoration: InputDecoration(
                      labelText: 'Description',
                      
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 223, 29, 126)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide:
                              BorderSide(color: Colors.red, width: 2.0))),






                padding: const EdgeInsets.only(
                    top: 16.0, left: 18.0, right: 18.0, bottom: 8.0),
                child: TextFormField(
                  cursorColor: Color.fromARGB(255, 223, 29, 126),
                  controller: DescriptionController,
                  decoration: InputDecoration(labelText: 'Nom',
                  style: TextStyle(
                  color: Colors.red),
                 border: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red),
  ),
  labelStyle: TextStyle(
    color: Colors.red,
  )),
                  keyboardType: TextInputType.multiline,
                  minLines: 3,
                  maxLines: 5,
                ))
             

            SizedBox(height: 8.0),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 223, 29, 126),
                ),
                onPressed: () {},
                child: Text('Creer'),
              ),
            ),
            SizedBox(height: 8.0),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 97, 37, 78),
                ),
                onPressed: () {},
                child: Text('Annuler'),
              ),
            ),
          ])), //form
    );
  }
}
