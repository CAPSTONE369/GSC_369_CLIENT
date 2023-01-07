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
      appBar: AppBar(title: const Text('Foods')),
      body: Center(
        child: Text("Here"),
      ),
    );
  }
}
