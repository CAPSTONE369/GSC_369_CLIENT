import 'dart:convert';
import 'dart:io';

import 'package:client/src/features/authentication/auth_platform.dart';
import 'package:client/src/features/food_fridge/fridge_page.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:http/http.dart' as http;
import 'package:client/src/features/food_fridge/fridge_page.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  AuthorizationPlatform _platform = AuthorizationPlatform.none;

  void singInWithKakao() async {
    try {
      bool isInstalled = await isKakaoTalkInstalled();
      OAuthToken token = isInstalled
          ? await UserApi.instance.loginWithKakaoTalk()
          : await UserApi.instance.loginWithKakaoAccount();

      print(token);

      final url = Uri.https('kapi.kakao.com', 'v2/user/me');

      final response = await http.get(
        url,
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer ${token.accessToken}'
        },
      );

      final profileInfo = jsonDecode(response.body);
      print(profileInfo.toString());

      setState(() {
        _platform = AuthorizationPlatform.kakao;
      });
    } catch (error) {
      print("카카오톡으로 로그인에 실패하였습니다.");
      print(error);
    }
  }

  Widget _kakaoLoginButton(String path, VoidCallback onTap) {
    return Card(
      // elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.antiAlias,
      child: Ink.image(
        image: AssetImage('assets/image/$path.png'),
        width: 300,
        height: 300,
        child: InkWell(
          onTap: onTap,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: _platform != AuthorizationPlatform.none
              ? Row()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _kakaoLoginButton(
                      'kakao_logo',
                      singInWithKakao,
                    )
                  ],
                )),
    );
  }
}
