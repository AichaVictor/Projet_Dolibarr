import 'package:flutter/material.dart';

import 'package:flutter/src/material/dropdown.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateCommand extends StatefulWidget {

  @override
  _CreateCommandState createState() => _CreateCommandState();
}
const List<String> list = <String>['Coumba', 'Aisha', 'Sougou', 'Mareme'];
class _CreateCommandState extends State<CreateCommand> {
  TextEditingController dateinput = TextEditingController();
  final RefController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String dropdownValue = "Selectionner un Tiers";

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

            title: Text('Créer Commande'),
            centerTitle: true,
            backgroundColor: Colors.purpleAccent,),
        body: Container(
          padding:
              const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: Builder(
                builder: (context) => Form(
                    key:_formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                            Padding(
                               padding: const EdgeInsets.only(
                                 top: 45.0, left: 18.0, right: 25.0, bottom: 8.0),
                                 child : TextFormField(
                                    controller: RefController,
                                    style: TextStyle(color: Color.fromARGB(255, 66, 125, 145)),
                                    decoration: const InputDecoration(

                                      labelText: 'Réf Client',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                      ),
                                      filled: false,
                                      prefixIcon: Icon(
                                        Icons.person,
                                        color: Colors.deepPurple,
                                      ),
                                    ),
                                ),
                            ),

                            Padding(
                                padding: const EdgeInsets.only(
                                  top: 5.0, left : 18.0, right: 25.0, bottom: 8.0),
                                child: TextFormField(
                                  controller: dateinput, //editing controller of this TextField
                                  decoration: const InputDecoration(

                                    prefixIcon: Icon(
                                      Icons.calendar_today,
                                      color: Colors.deepPurple,
                                    ),//icon of text field
                                    labelText: "Enter Date",//label text of field
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                    ),),

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

                          DropdownButtonExample(),

                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                            child: Row(
                              children: [

                                ElevatedButton(

                                  style: OutlinedButton.styleFrom(
                                      backgroundColor: Colors.purple ,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      )
                                  ),
                                  onPressed: (){},
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
                                        backgroundColor: Colors.purple,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15),
                                        )
                                    ),
                                    onPressed: (){},
                                    child: const Text(
                                      "ANNULER",
                                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                                    )
                                )
                              ],
                            ),
                          ),

                        ],
                    )
                ),
              ),
        ),
        ),
        debugShowCheckedModeBanner: false,
    );
  }
}
class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}





