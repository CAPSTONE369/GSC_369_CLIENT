import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ModalMenu {
  const ModalMenu(this.iconData, this.text);
  final IconData iconData;
  final String text;
}

class RegisterModal extends StatefulWidget {
  const RegisterModal({super.key});

  @override
  State<RegisterModal> createState() => _RegisterModalState();
}

class _RegisterModalState extends State<RegisterModal> {
  final modalList = <ModalMenu>[];

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
              // for (var i in )
            ],
          )),
    );
  }
}
