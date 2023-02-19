import 'package:flutter/material.dart';

class CreateUsers extends StatefulWidget {
  const CreateUsers({Key? key}) : super(key: key);

  @override
  State<CreateUsers> createState() => _CreateUsersState();
}

class _CreateUsersState extends State<CreateUsers> {
  bool _isVisible = false;
  bool _isPassword12 = false;
  int selected = 0;
  final formKey = GlobalKey<FormState>();
  final nomController = TextEditingController();
  final prenomController = TextEditingController();
  final identifiantController = TextEditingController();
  final adresseController = TextEditingController();
  final motDePasseController = TextEditingController();

  onPasswordChanged(String password){
    setState(() {
      _isPassword12 = false;
      if(password.length >= 12)
        _isPassword12 = true;
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    nomController.dispose();
    prenomController.dispose();
    identifiantController.dispose();
    adresseController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Nouvel utilisateur"),
        backgroundColor : Colors.purple,
      ),
      body: Form(
          key: formKey,
          child: ListView(children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 45.0, left: 18.0, right: 18.0, bottom: 8.0),
              child: TextFormField(
                  controller: nomController,
                  decoration:  InputDecoration(
                      labelText: 'Nom',
                      border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(20.0)),)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuiller saisir votre nom';
                    }
                    return null;
                  }),
            ),
            Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, left: 18.0, right: 18.0, bottom: 8.0),
                child: TextFormField(
                  controller: prenomController,
                  decoration:  InputDecoration(
                      labelText: 'Prenom',
                      border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(20.0)))),
                )),
            Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, left: 18.0, right: 18.0, bottom: 8.0),
                child: TextFormField(
                    controller: identifiantController,
                    decoration:  InputDecoration(
                        labelText: 'Identifiant',
                        border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(20.0)))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuiller saisir votre identifiant';
                      }
                      return null;
                    }
                )),
            Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, left: 18.0, right: 18.0, bottom: 8.0),
                child: TextFormField(
                  controller: adresseController,
                  decoration:  InputDecoration(
                      labelText: 'Adresse',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)))),
                  keyboardType: TextInputType.multiline,
                  minLines: 2,
                  maxLines: 3,
                )),
            Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, left: 18.0, right: 18.0, bottom: 8.0) ,
              child: DropdownButtonFormField(
                  items: [
                    DropdownMenuItem(value: 1 ,child: Text("Oui")),
                    DropdownMenuItem(value: 0 ,child: Text("Non"))
                  ],
                  decoration: InputDecoration(
                      labelText: 'Administrateur',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0))
                      )),
                  value: selected,
                  onChanged: (value){
                    setState(() {
                      selected = value!;
                    });
                  }
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, left: 18.0, right: 18.0, bottom: 8.0),
              child: TextFormField(
                  onChanged: (password) => onPasswordChanged(password),
                  obscureText: !_isVisible,
                  controller: motDePasseController,
                  decoration: InputDecoration(
                      labelText: 'Mot de passe',
                      suffixIcon: IconButton(onPressed: (){
                        setState(() {
                          _isVisible = !_isVisible;
                        });
                      },
                        icon: _isVisible ? Icon(Icons.visibility, color: Colors.black,) : Icon(Icons.visibility_off, color: Colors.grey,),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)))),
                  validator: (value) {
                    if (value == null || value.isEmpty || _isPassword12 == false) {
                      return 'Veuiller saisir votre mot de passe, il doit avoir 12'
                          ' caracteres';
                    }
                    return null;
                  }
              ),
            ),

            SizedBox(height: 15,),
            Row(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: _isPassword12 ? Colors.green : Colors.transparent,
                      border: _isPassword12 ? Border.all(color: Colors.transparent ) :
                      Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: Center(child: Icon(Icons.check, color: Colors.white, size: 15,),),
                ),
                SizedBox(width: 10,),
                Text("Contient au moins 12 caracteres")
              ],
            ),
            SizedBox(height: 8.0),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  if(formKey.currentState!.validate()){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>UserProfilePage(
                        nom: nomController.text,
                        prenom: prenomController.text,
                        identifiant: identifiantController.text,
                        adresse: adresseController.text,
                      )));
                    } catch (e) {
                      print(e.toString());
                    }

                }},
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
          ])), //form
    );
  }
}
