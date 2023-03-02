import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RegisterTextBox extends StatelessWidget {
  final String text;
  final int value;
  final double size;
  const RegisterTextBox(
      {super.key, required this.text, required this.value, required this.size});

  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: value,
        child: Container(
          alignment: Alignment.center,
          height: 40,
          width: size,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Text(
              text,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ));
  }
}
