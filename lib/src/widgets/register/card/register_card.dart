import 'package:flutter/material.dart';

class RegisterCard extends StatefulWidget {
  const RegisterCard({super.key});

  @override
  State<RegisterCard> createState() => _RegisterCardState();
}

class _RegisterCardState extends State<RegisterCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92,
      child: const ColoredBox(color: Color(0xffF3F4FB)),
    );
  }
}
