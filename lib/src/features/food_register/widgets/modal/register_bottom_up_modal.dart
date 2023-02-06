import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'buttons/camera_button.dart';
import 'buttons/form_button.dart';
import 'buttons/image_button.dart';

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
      // color: Colors.transparent,
      child: Container(
          decoration: const BoxDecoration(
              color: Color(0xffF3F4FB),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(36.0),
                topRight: Radius.circular(36.0),
              )),
          child: Row(
            children: [
              const Flexible(flex: 1, child: SizedBox.expand()),
              Flexible(
                  flex: 8,
                  child: Column(
                    children: const [
                      Flexible(flex: 2, child: SizedBox.expand()),
                      Flexible(flex: 3, child: RegisterCameraButton()),
                      Divider(),
                      Flexible(flex: 3, child: RegisterImageButton()),
                      Divider(),
                      Flexible(flex: 3, child: RegisterFormButton()),
                      Flexible(flex: 2, child: SizedBox.expand()),
                    ],
                  )),
              const Flexible(flex: 1, child: SizedBox.expand()),
            ],
          )),
    );
  }
}
