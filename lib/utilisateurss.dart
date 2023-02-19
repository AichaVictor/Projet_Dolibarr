import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class User {
  final String id;
  final String firstname;
  final String lastname;

  User({required this.id, required this.firstname, required this.lastname});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstname: json['firstname'],
      lastname: json['lastname'],
    );
  }
}

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List<User> _users = [];

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    try {
      final response = await http.get(
          Uri.parse(
              'https://dolibarr.with6.dolicloud.com/api/index.php/users'),
          headers: {
            'DOLAPIKEY': 'api',
          });
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List;
        final users = data.map((e) => User.fromJson(e)).toList();
        setState(() {
          _users = users;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error fetching users')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) {
          final user = _users[index];
          return ListTile(
            title: Text('${user.firstname} ${user.lastname}'),
            subtitle: Text(user.id),
          );
        },
      ),
    );
  }
}
