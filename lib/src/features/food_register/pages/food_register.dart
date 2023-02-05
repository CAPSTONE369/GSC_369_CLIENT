import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FoodRegisterFormPage extends StatefulWidget {
  const FoodRegisterFormPage({super.key});

  @override
  State<FoodRegisterFormPage> createState() => _FoodRegisterFormPageState();
}

class _FoodRegisterFormPageState extends State<FoodRegisterFormPage> {
  bool shadowColor = false;
  double? scrolledUnderElevation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "식재료 추가하기",
          style:
              TextStyle(color: Color(0xff395BA9), fontWeight: FontWeight.bold),
        ),
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        scrolledUnderElevation: scrolledUnderElevation,
        shadowColor: shadowColor ? Theme.of(context).colorScheme.shadow : null,
        elevation: 1,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context); //뒤로가기
            },
            color: Color(0xff44464F),
            icon: Icon(Icons.arrow_back)),
      ),
      body: const Center(
        child: Text("FoodRegisterFormPage"),
      ),
    );
  }
}
