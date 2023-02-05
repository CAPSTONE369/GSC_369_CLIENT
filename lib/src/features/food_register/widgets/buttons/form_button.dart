import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class RegisterFormButton extends StatefulWidget {
  const RegisterFormButton({super.key});

  @override
  State<RegisterFormButton> createState() => _RegisterFormButtonState();
}

class _RegisterFormButtonState extends State<RegisterFormButton> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {},
        child: Row(
          children: [
            const Flexible(flex: 1, child: SizedBox.expand()),
            Flexible(
                flex: 2,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                      color: Color(0xffDAE2FF), shape: BoxShape.circle),
                  child: const Icon(Icons.create_outlined),
                )),
            const Flexible(flex: 1, child: SizedBox.expand()),
            Flexible(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "직접 입력",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const Flexible(flex: 2, child: SizedBox.expand()),
          ],
        ),
      ),
    );
  }
}
