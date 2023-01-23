import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class RegisterModal extends StatefulWidget {
  const RegisterModal({super.key});

  @override
  State<RegisterModal> createState() => _RegisterModalState();
}

class _RegisterModalState extends State<RegisterModal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.amber,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('Modal BottomSheet'),
            ElevatedButton(
              child: const Text('Done!'),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
      ),
    );
  }
}
