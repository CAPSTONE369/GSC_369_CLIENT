import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class RegisterCameraButton extends StatefulWidget {
  const RegisterCameraButton({super.key});

  @override
  State<RegisterCameraButton> createState() => _RegisterCameraButtonState();
}

class _RegisterCameraButtonState extends State<RegisterCameraButton> {
  File? _image;
  final picker = ImagePicker();

  Future getImage(ImageSource imageSource) async {
    final image = await picker.pickImage(source: imageSource);

    setState(() {
      _image = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return Card(
      color: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          getImage(ImageSource.camera);
        },
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
                child: const Icon(Icons.camera_alt_rounded),
              ),
            ),
            const Flexible(flex: 1, child: SizedBox.expand()),
            Flexible(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text("CAMERA", style: TextStyle(fontSize: 16)),
              ),
            ),
            const Flexible(flex: 2, child: SizedBox.expand()),
          ],
        ),
      ),
    );
  }
}
