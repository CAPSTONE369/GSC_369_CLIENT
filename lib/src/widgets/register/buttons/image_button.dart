import 'dart:convert';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:dio/dio.dart';

class RegisterImageButton extends StatefulWidget {
  const RegisterImageButton({super.key});

  @override
  State<RegisterImageButton> createState() => _RegisterImageButtonState();
}

class _RegisterImageButtonState extends State<RegisterImageButton> {
  final ImagePicker _picker = ImagePicker();
  late File _image = File('assets/image/btnG_.png');
  static final storage = FlutterSecureStorage();

  Future _getImage(ImageSource imageSource) async {
    final image = await _picker.pickImage(source: imageSource);

    setState(() {
      _image = File(image!.path);
    });
    print(_image);

    var dio = Dio();
    dio.options.contentType = "multipart/form-data";
    dio.options.maxRedirects.isInfinite;
    print(_image.path);

    var formData =
        FormData.fromMap({'file': await MultipartFile.fromFile(_image.path)});
    print(formData);

    var response = await dio.post(
      'https://ocr.zefridge.xyz/model',
      data: formData,
    );
    print(response.data[0]["name"]);

    List apiRequest = [];
    for (int i = 0; i < response.data.length; i++) {
      Map<String, dynamic> data = {
        "fridgeId": 1,
        "name": response.data[i]["name"],
        "quantity": '0',
        "memo": "생성됨",
        "type": 'ETC',
        "freezeType": 'COLD',
        "expriyDate": DateTime.now().toIso8601String()
      };
      apiRequest.add(data);
    }

    final url = Uri.https('api.zefridge.xyz', "/food");
    final Map<String, String> tokens = await storage.readAll();
    var apiResponse = await http.post(url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": tokens['accessToken'].toString()
        },
        body: jsonEncode(apiRequest));
    List list = jsonDecode(utf8.decode(apiResponse.bodyBytes));
    print(list);
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
