import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:flutter/src/material/dropdown.dart';
import '../InterfaceCommande.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const api ='https://dolibarr.with6.dolicloud.com/api/index.php/orders?sortfield=t.rowid&sortorder=ASC&limit=100';

class CreateCommand extends StatefulWidget {

  @override
  _CreateCommandState createState() => _CreateCommandState();
}
var dropdownvalue;
class _CreateCommandState extends State<CreateCommand> {
  String dropdownValue = 'Cheque';
  String dropdownVal2 = 'KANE';

  TextEditingController dateinput = TextEditingController();
  TextEditingController textarea = TextEditingController();
  final RefController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home :Scaffold(

        appBar: AppBar(

            title: Text('Créer Commande', style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold, fontSize: 20)),
            centerTitle: true,
            backgroundColor: Colors.white70),
        body: Container(
          padding:
          const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Builder(
            builder: (context) => Form(

                key:_formKey,
                child: SingleChildScrollView(
                    child : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 70.0, left: 2.0, right: 2.0, bottom: 25.0),
                          child : TextFormField(
                            controller: RefController,
                            style: TextStyle(color: Color.fromARGB(255, 66, 125, 145)),
                            decoration: const InputDecoration(

                              labelText: 'Réf Client',
                              hintText: 'renseignez la réference',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(color: Colors.deepPurple, width: 5.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.deepPurple, width: 1),
                              ),
                              filled: false,
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ),
                        ),

                        DecoratedBox(
                            decoration: BoxDecoration(

                                color:Colors.purple.shade50, //background color of dropdown button
                                border: Border.all(color: Colors.deepPurple, width:1), //border of dropdown button
                                borderRadius: BorderRadius.circular(10), //border raiuds of dropdown button
                                boxShadow: <BoxShadow>[ //apply shadow on Dropdown button
                                  BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                                      blurRadius: 5) //blur radius of shadow
                                ]
                            ),

                            child:Padding(
                              padding: EdgeInsets.only(left:30, right:30),
                              child:
                              // Step 2.
                              DropdownButton<String>(
                                // Step 3.
                                value: dropdownVal2,
                                hint : Text('Tiers'),
                                // Step 4.
                                items: <String>['KANE', 'VICTOR', 'SOUGOU', 'SARR',]
                                    .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,

                                    child: Text(
                                      value,
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  );
                                }).toList(),
                                // Step 5.
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownValue = newValue!;
                                  });
                                },

                              ),


                            )
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, left : 2.0, right: 2.0, bottom: 28.0),
                          child: TextFormField(
                            controller: dateinput, //editing controller of this TextField
                            decoration: const InputDecoration(

                              prefixIcon: Icon(
                                Icons.calendar_today,
                                color: Colors.deepPurple,
                              ),//icon of text field
                              labelText: "Mettez la date",//label text of field
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(color: Colors.deepPurple, width: 5.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.deepPurple, width: 1),
                              ),
                            ),

                            readOnly: true,  //set it true, so that user will not able to edit text
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context, initialDate: DateTime.now(),
                                  firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                                  lastDate: DateTime(2101)
                              );

                              if(pickedDate != null ){
                                print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                                String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                                print(formattedDate); //formatted date output using intl package =>  2021-03-16
                                //you can implement different kind of Date Format here according to your requirement

                                setState(() {
                                  dateinput.text = formattedDate; //set output date to TextField value.
                                });
                              }else{
                                print("Date is not selected");
                              }
                            },

                          ),
                        ),
                        DecoratedBox(
                            decoration: BoxDecoration(
                                color:Colors.purple.shade50, //background color of dropdown button
                                border: Border.all(color: Colors.deepPurple, width:1), //border of dropdown button
                                borderRadius: BorderRadius.circular(10), //border raiuds of dropdown button
                                boxShadow: <BoxShadow>[ //apply shadow on Dropdown button
                                  BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                                      blurRadius: 5) //blur radius of shadow
                                ]
                            ),

                            child:Padding(
                              padding: EdgeInsets.only(left:30, right:30),
                              child:
                              // Step 2.
                              DropdownButton<String>(
                                // Step 3.
                                value: dropdownValue,

                                // Step 4.
                                items: <String>['Cheque', 'Espece', 'Virement', 'Autre',]
                                    .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,

                                    child: Text(
                                      value,
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  );
                                }).toList(),
                                // Step 5.
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownValue = newValue!;
                                  });
                                },

                              ),


                            )
                        ),
                        const SizedBox(
                          height: 25, //<-- SEE HERE
                        ),
                        TextField(
                          controller: textarea,
                          keyboardType: TextInputType.multiline,
                          maxLines: 4,
                          decoration: InputDecoration(
                            hintText: "Note privée",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                              borderSide: BorderSide(color: Colors.deepPurple, width: 5.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.deepPurple, width: 1),
                            ),
                            filled: false,
                            prefixIcon: Icon(
                              Icons.account_circle,
                              color: Colors.deepPurple,
                            ),
                          ),

                        ),



                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                          child: Row(
                            children: [

                              ElevatedButton(

                                style: OutlinedButton.styleFrom(
                                    backgroundColor: Colors.purple.shade900 ,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    )
                                ),
                                onPressed: (){
                                  var _reference = RefController.text;
                                  var _datesaisie = dateinput.text;
                                },
                                child: const Text(
                                  'CREER BROUILLON',
                                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                width: 20, //<-- SEE HERE
                              ),
                              ElevatedButton(
                                  style: OutlinedButton.styleFrom(
                                      backgroundColor: Colors.purple.shade900,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      )
                                  ),
                                  onPressed: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => CommandePage()),//à modifier
                                    );
                                  },
                                  child: const Text(
                                    "ANNULER",
                                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                                  )
                              )
                            ],
                          ),
                        ),

                      ],
                    ))
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}








