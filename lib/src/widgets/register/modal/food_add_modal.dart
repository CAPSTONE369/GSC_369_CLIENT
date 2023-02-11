import 'dart:ffi';

import 'package:client/src/controller/food_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<String> sortingList = <String>['육류', '채소', '유제품', '과일', '기타'];
List<String> frozenList = <String>['냉동', '냉장'];

class FoodAddModal extends StatefulWidget {
  const FoodAddModal({super.key});

  @override
  State<FoodAddModal> createState() => _FoodAddModalState();
}

class _FoodAddModalState extends State<FoodAddModal> {
  late String _name;
  late String _date;
  late String _quantity;
  late Bool _isFrozen;
  late String _classification;

  String sortingValue = sortingList.first;

  @override
  Widget build(BuildContext context) {
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      title: const Text('New Food!'),
      content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                labelText: 'Food Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
              initialValue: '',
              onSaved: (value) {
                _name = value!;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                labelText: 'Quantity',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
              initialValue: '',
              onSaved: (value) {
                _quantity = value!;
              },
            ),
            DropdownButton<String>(
                value: sortingValue,
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
                    sortingValue = value!;
                  });
                },
                items:
                    sortingList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList()),
          ]),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    );
  }
}
