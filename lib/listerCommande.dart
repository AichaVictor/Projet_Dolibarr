import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../backend.dart';
import '../StockModel.dart';
import '../createCommande.dart';
import '../InterfaceCommande.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class OrderIcon extends StatelessWidget {
  final double size;
  final Color color;

  const OrderIcon({Key? key, this.size = 20.0, this.color = Colors.deepPurple})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.add_card_rounded,
      size: size,
      color: color,
    );
  }
}

class HomeCommande extends StatelessWidget {
  const HomeCommande({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Liste des Commandes', textAlign: TextAlign.center, style: TextStyle(wordSpacing: 3,letterSpacing: 2,color: Colors.purple.shade900,fontWeight: FontWeight.bold, fontSize: 20),),
        backgroundColor: Colors.purple.shade50,
        elevation: 22.0,
        shadowColor: Colors.purple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40)),
          side: BorderSide(
              width: 1,
              color: Colors.deepPurple.shade900,
              style: BorderStyle.none
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(25),
          child: SizedBox(),
        ),
        actions: [
          IconButton(icon: Icon(Icons.add_circle),
            onPressed: () {
    Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateCommand()),
          );
            },
          )
        ],
      ),
      body: const Center(
        child: UsersList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /*Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );*/
        },
        backgroundColor: Color.fromARGB(234, 4, 34, 75),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class UsersList extends StatefulWidget {
  const UsersList({super.key});

  @override
  State<StatefulWidget> createState() {
    return _UsersListState();
  }
}

class _UsersListState extends State<UsersList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Commandes>>(
      future: fetchCommandes(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          List<Commandes>? commandes = snapshot.data;
          return UserListWidget(userList: commandes);
        } else {
          return const Center(
            child: Text('Désolée : Erreur lors de la récupération des commandes.'),
          );
        }
      },
    );
  }
}

class UserListWidget extends StatelessWidget {
  final List<Commandes>? userList;

  const UserListWidget({super.key, required this.userList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.white,
          child: ListView.builder(
            itemCount: userList?.length,
            itemBuilder: (BuildContext context, int index) {
              final user = userList![index];
              return ListTile(
                leading: OrderIcon(size: 34.0, color: Color.fromARGB(234, 4, 34, 75)),
                title: Text(
                  "${user.ref}  ${DateFormat('dd/MM/yyyy').format(DateTime.fromMillisecondsSinceEpoch(user.date))}   ${user.userAuthor} ",
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(234, 4, 34, 75),
                  ),
                ),
                //subtitle: Text("${user.lastname}  ${user.firstname}"),
                trailing: IconButton(
                  icon: Icon(Icons.star, size: 24.0, color: Colors.yellow),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CreateCommand()),//à modifier
                    );
                  },
                ),
                onTap: () {

                },
              );
            },
          ),
        ));
  }
}