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
  final urlPubliqueController = TextEditingController();
  final EntrepotController = TextEditingController();
  final limiteStockController = TextEditingController();
  final stockOptimalController = TextEditingController();
  final natureProduitController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    RefController.dispose();
    libelleController.dispose();
    EtatVenteController.dispose();
    EtatAchatController .dispose();
    DescriptionController.dispose();
    urlPubliqueController.dispose();
    EntrepotController.dispose();
    limiteStockController.dispose();
    stockOptimalController.dispose();
    natureProduitController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nouveau produit"),
      ),
      body: Form(
        key: formKey,
        child:ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 45.0, left: 18.0, right: 18.0, bottom: 8.0),
                child: TextFormField(
                controller: RefController,
                decoration: InputDecoration(
                  labelText : 'Reference',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))
                  )
                ),
                validator: (value){
                  if (value==null || value.isEmpty){
                    return 'Veuiller saisir la reference';
                  }
                  return null;
                }
              ),
            ),
              Padding(
                  padding: EdgeInsets.only(
                      top: 16.0, left: 18.0, right: 18.0, bottom: 8.0),
                  child: TextFormField(
                    controller: libelleController,
                    decoration: InputDecoration(
                        labelText : 'Libelle',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0))
                        )
                    ),
                    validator: (value){
                      if (value==null || value.isEmpty){
                        return 'Veuiller saisir le libelle';
                      }
                      return null;
                    },
                  )
              ),
            Padding(
            padding: const EdgeInsets.only(
              top: 16.0, left: 18.0, right: 18.0, bottom: 8.0),
          child: TextFormField(
              controller: limiteStockController,
              decoration: InputDecoration(
                  labelText : 'Limite du stock (alerte)',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))
                  )
              )
          )
            ),
              Padding(
                  padding: const EdgeInsets.only(
                      top: 16.0, left: 18.0, right: 18.0, bottom: 8.0),
                  child: TextFormField(
                      controller: DescriptionController,
                      decoration: InputDecoration(
                          labelText : 'Description',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20.0))
                          )
                      ),
                    keyboardType: TextInputType.multiline,
                    minLines: 3,
                    maxLines: 5,
                  )

              ),

              SizedBox(height:8.0),
              Center(
                child: ElevatedButton(
                  onPressed: (){},
                  child: Text('Creer'),
                ),
              ),
              SizedBox(height:8.0),
              Center(
                child: ElevatedButton(
                  onPressed: (){},
                  child: Text('Annuler'),
                ),
              )
            ]
        )
      ),  //form
    );
  }
}
