import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../StockModel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:intl/intl.dart';

const api ='https://dolibarr.with6.dolicloud.com/api/index.php/orders';

Future<List<Commandes>> fetchCommandes() async {
  var token = await SessionManager().get("token");
  final response = await http.Client().get(Uri.parse(api),
      headers: ({
        'DOLAPIKEY' : '127vu2oyHAs6s8yMf5LeIP7XCEC5dO4k'//token.toString(),
      }));
  print(response.statusCode);

  if(response.statusCode == 200){
    List commandes = json.decode(response.body) as List;
    return commandes.map((commandes) => Commandes.fromJson(commandes)).toList();
  } else{
    throw Exception('Impossible de récupérer les commandes');
  }
}