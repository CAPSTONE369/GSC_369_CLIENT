import 'dart:convert';
import 'dart:io';

import 'package:client/src/model/Auth.dart';
import 'package:client/src/model/auth_platform.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:client/src/pages/fridge_page.dart';
import 'package:client/src/pages/route/main_page.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:http/http.dart' as http;
import 'package:client/src/pages/fridge_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  AuthorizationPlatform _platform = AuthorizationPlatform.none;
  static final storage = FlutterSecureStorage();
  dynamic accessToken = '';
  dynamic refreshToken = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _asyncMethod();
    });
  }

  _asyncMethod() async {
    accessToken = await storage.read(key: 'acessToken');
    refreshToken = await storage.read(key: 'refreshToken');
    if (accessToken != null && refreshToken != null) {
      Navigator.pushNamed(context, '/main');
    }
  }

  void singInWithKakao() async {
    try {
      bool isInstalled = await isKakaoTalkInstalled();
      OAuthToken token = isInstalled
          ? await UserApi.instance.loginWithKakaoTalk()
          : await UserApi.instance.loginWithKakaoAccount();

      final url = Uri.https('kapi.kakao.com', 'v2/user/me');

      final response = await http.get(
        url,
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer ${token.accessToken}'
        },
      );

      final profile = jsonDecode(response.body);

      // final apiUrl = Uri.http('localhost:8080', 'login/kakao');
      // final apiResponse = await http.post(apiUrl, body: response.body);
      // if (apiResponse.statusCode == 200) {}

      setState(() {
        _platform = AuthorizationPlatform.kakao;
      });

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainPage()));
    } catch (error) {
      print("카카오톡으로 로그인에 실패하였습니다.");
      print(error);
    }
  }

  void signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser != null) {
      final apiUrl = Uri.http('localhost:8080', 'login/google');
      Map<String, dynamic> googleJsonRequest = {
        'name': googleUser.displayName,
        'email': googleUser.email,
        'id': googleUser.id,
        'profile': googleUser.photoUrl
      };
      final apiResponse = await http.post(apiUrl,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(googleJsonRequest));
      var authResponse = jsonDecode(utf8.decode(apiResponse.bodyBytes));
      Auth auth =
          Auth(authResponse['accessToken'], authResponse['refreshToken']);
      await storage.write(key: 'accessToken', value: auth.accessToken);
      await storage.write(key: 'refreshToken', value: auth.refreshToken);
      // ignore: use_build_context_synchronously
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainPage()));
    }
  }

  Widget _oauth_login_button(String path, VoidCallback onTap) {
    var Image = AssetImage('assets/image/$path.png');
    return Card(
      // elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.antiAlias,
      child: Ink.image(
        image: Image,
        width: 300,
        height: 60,
        fit: BoxFit.fill,
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
              ? Column()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Welcome To"),
                    const Text("Speaking Fridgy"),
                    const SizedBox(height: 100),
                    _oauth_login_button(
                      'kakao_logo',
                      singInWithKakao,
                    ),
                    _oauth_login_button(
                      'google_logo',
                      signInWithGoogle,
                    ),
                    _oauth_login_button(
                      'naver_logo',
                      singInWithKakao,
                    )
                  ],
                )),
    );
  }
}
