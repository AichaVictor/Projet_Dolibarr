import 'package:flutter/material.dart';


class CreateMenuDeroul extends StatefulWidget {
  @override
  _CreateMenuDeroulState createState() => _CreateMenuDeroulState();
}

class _CreateMenuDeroulState extends State<CreateMenuDeroul> {
  late String _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: DropdownButton<String>(
          value: _selectedOption,
          onChanged: (newValue) {
            setState(() {
              _selectedOption = newValue!;
            });
          },
          items: <String>['Option 1', 'Option 2', 'Option 3']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
