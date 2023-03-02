import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class FoodAddModalTextInputForm extends StatelessWidget {
  final void Function(String?)? onSaved;
  final String field;
  const FoodAddModalTextInputForm(
      {super.key, this.onSaved, required this.field});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: field,
        fillColor: Color(0xffFDFCFF),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        labelStyle: new TextStyle(color: Colors.black),
      ),
      initialValue: '',
      onSaved: onSaved,
    );
  }
}
