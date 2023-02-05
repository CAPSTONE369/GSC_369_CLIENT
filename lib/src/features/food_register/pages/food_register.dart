import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FoodRegisterFormPage extends StatefulWidget {
  const FoodRegisterFormPage({super.key});

  @override
  State<FoodRegisterFormPage> createState() => _FoodRegisterFormPageState();
}

class _FoodRegisterFormPageState extends State<FoodRegisterFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 1,
      ),
      body: Center(
        child: Text("FoodRegisterFormPage"),
      ),
    );
  }
}
