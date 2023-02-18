import 'package:dolibarr/login2_page.dart';
import 'package:dolibarr/main.dart';
import 'package:flutter/material.dart';
class login_page extends StatelessWidget  {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor:Colors.white, 
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              Column(
                children: <Widget> [
                  Text("Welcome",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:AssetImage("assets/login.PNG") 
                        )
                    ),
                    ),
                    Column(
                      children: <Widget> [
                        MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => login_page()));
                        },
                        
                        
                        ),
                        
                        SizedBox(height: 20),
                        MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () {
                            Navigator.push(context,
                             MaterialPageRoute(builder: (context) => login2()));
                          },
                          color: Color(0xff0095FF),
                          //shape
                        shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(50),
                               
                        ),
                        child: Text("Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18
                        ),),
                )
                      ]          
                    ),
                ],
      
              ),
            ],
      
      ))));
  }
}
      