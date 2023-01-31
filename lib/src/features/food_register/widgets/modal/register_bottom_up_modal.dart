import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../buttons/camera_button.dart';

class RegisterModal extends StatefulWidget {
  const RegisterModal({super.key});

  @override
  State<RegisterModal> createState() => _RegisterModalState();
}

class _RegisterModalState extends State<RegisterModal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Colors.transparent,
      child: Container(
          decoration: const BoxDecoration(
              color: Color(0xffF3F4FB),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(36.0),
                topRight: Radius.circular(36.0),
              )),
          child: Column(
            children: [
              Ink.image(
                image: AssetImage('assets/image/modal_drag_handle.png'),
                width: 32,
                height: 4,
                fit: BoxFit.fill,
              ),
              RegisterCameraButton()
            ],
          )),
    );
  }
}
