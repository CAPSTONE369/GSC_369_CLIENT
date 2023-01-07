import 'package:client/src/features/food_fridge/fridge_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome Speaking Fridge!')),
      body: Center(
          child: OutlinedButton(
        child: Text("Next Page"),
        onPressed: () {
          Navigator.pushNamed(context, '/food');
        },
      )),
    );
  }
}
