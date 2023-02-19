import 'dart:convert';
import 'package:dolibarr/utilisateurss.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Login2 extends StatefulWidget {
  @override
  _Login2 createState() => _Login2();
}

class _Login2 extends State<Login2> {
  final loginController= TextEditingController();
  final passController= TextEditingController();
  
  final _labelStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: Colors.black87,
  );

  final _borderStyle = OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey[400]!,
    ),
  );

  Future<dynamic> loginUser(String login, String password) async {
  final response = await http.post(
    Uri.parse('https://dolibarr.with6.dolicloud.com/api/index.php/explorer/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'login': login,
      'password': password,
      
    }),
  );

  if (response.statusCode == 200) {
    
    final data=jsonDecode(response.body);
    final token = data['success']['token'] as String;
      final user = User.fromJson(data);
      setState(() { 
    });
    print('connextion reussie');
    } else {
      throw Exception('Failed to login');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        "Connectez-vous ",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                

                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  TextFormField(
                    controller:loginController,

                    obscureText: false,
                    decoration: InputDecoration(
                    labelText: "Identifiant", prefixIcon: Align(widthFactor: 1.0,heightFactor: 1.0, child: Icon(Icons.person),),
                    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(
                    color: Colors.grey[400]! 
                   ),
                   ),
                    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey[400]!)
                   )
                   ),
                   ),
                 SizedBox(height: 10,),
                  
                 TextFormField(
                    controller:passController,
                    obscureText: true,
                    decoration: InputDecoration(
                    labelText: "Mot de passe",prefixIcon: Align(widthFactor: 1.0,heightFactor: 1.0, child: Icon(Icons.lock),),
                    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(
                    color: Colors.grey[400]! 
                    ),
                    ),
                   border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey[400]!)
                    )
                    ),
                    ),
                  SizedBox(height: 10,),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: MaterialButton(
                minWidth: double.infinity,
                height: 60,
                onPressed: () {loginUser(loginController.text, passController.text);
                },
                color: Color(0xff0095ff),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  "Se connecter",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 100),
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/login1.PNG"),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }}
