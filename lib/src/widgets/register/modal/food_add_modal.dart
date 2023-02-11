import 'package:client/src/controller/food_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodAddModal extends StatefulWidget {
  const FoodAddModal({super.key});

  @override
  State<FoodAddModal> createState() => _FoodAddModalState();
}

class _FoodAddModalState extends State<FoodAddModal> {
  @override
  Widget build(BuildContext context) {
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);
    return AlertDialog(
      title: const Text('AlertDialog Title'),
      content: const Text('AlertDialog description'),
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
