import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class RegisterImageButton extends StatefulWidget {
  const RegisterImageButton({super.key});

  @override
  State<RegisterImageButton> createState() => _RegisterImageButtonState();
}

class _RegisterImageButtonState extends State<RegisterImageButton> {
  final ImagePicker _picker = ImagePicker();
  late File _image = File('assets/image/btnG_.png');

  Future _getImage(ImageSource imageSource) async {
    final image = await _picker.pickImage(source: imageSource);

    setState(() {
      _image = File(image!.path);
    });
    print(_image);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          _getImage(ImageSource.gallery);
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
                  child: const Icon(Icons.image_rounded),
                )),
            const Flexible(flex: 1, child: SizedBox.expand()),
            Flexible(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text("PHOTO", style: TextStyle(fontSize: 16)),
              ),
            ),
            const Flexible(flex: 2, child: SizedBox.expand()),
          ],
        ),
      ),
    );
  }
}
