import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RegisterTextBox extends StatelessWidget {
  final String text;
  const RegisterTextBox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(3),
      child: Text(
        text,
        style: const TextStyle(fontSize: 20, backgroundColor: Colors.white),
      ),
    );
  }
}
