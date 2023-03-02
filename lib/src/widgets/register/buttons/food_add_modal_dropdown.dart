import 'package:flutter/material.dart';

class FoodAddModalDropDown extends StatelessWidget {
  final String sortingValue;
  final List<String> items;
  final Function(String?)? onChanged;
  const FoodAddModalDropDown(
      {super.key,
      required this.sortingValue,
      required this.items,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        value: sortingValue,
        icon: const Icon(Icons.arrow_drop_down),
        elevation: 16,
        style: const TextStyle(color: Colors.black),
        underline: Container(
          height: 2,
          color: Color(0xff395BA9),
        ),
        onChanged: onChanged,
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList());
  }
}
