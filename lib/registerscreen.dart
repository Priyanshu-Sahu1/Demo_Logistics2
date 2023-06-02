import 'package:flutter/material.dart';
import 'package:welcomescreen/supplierscreen.dart';
import 'package:welcomescreen/transportscreen.dart';
import 'package:welcomescreen/truckownerscreen.dart';

import 'buyerscreen.dart';

class MyDropdown extends StatefulWidget {
  @override
  _MyDropdownState createState() => _MyDropdownState();
}

class _MyDropdownState extends State<MyDropdown> {
  String selectedValue = 'Select Your Role';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Please Select Your Role from the DropDown Button and Click on Continue'),
      ),
      body: Center(
        child: DropdownButton<String>(
          value: selectedValue,
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue!;
            });
          },
          items: <String>[
            'Select Your Role',
            'Buyer',
            'Supplier',
            'Truck Owner',
            'Transport'
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        String pageName = '$selectedValue';
        if (pageName == 'Buyer') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Buyer()),
          );

          print('Selected value: $selectedValue');
        }
        ;
        if (pageName == 'Supplier') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Supplier()),
          );

          print('Selected value: $selectedValue');
        }
        ;
        if (pageName == 'Truck Owner') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TruckOwner()),
          );

          print('Selected value: $selectedValue');
        }
        ;
        if (pageName == 'Transport') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => transport()),
          );

          print('Selected value: $selectedValue');
        }
        ;
        child:
        const Text('Continue');
      }),
    );
  }
}
