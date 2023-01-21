import 'package:client/src/features/food_fridge/widgets/fridge_appbar.dart';
import 'package:client/src/features/food_fridge/widgets/fridge_big_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FridgePage extends StatefulWidget {
  const FridgePage({super.key});

  @override
  State<FridgePage> createState() => _FridgePageState();
}

class _FridgePageState extends State<FridgePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          FridgeAppBar(),
          const FridgeBigDivider(),
        ],
      )),
    );
  }
}
