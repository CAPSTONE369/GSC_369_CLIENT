import 'dart:convert';
import 'dart:io';

import 'package:client/src/model/Auth.dart';
import 'package:client/src/model/auth_platform.dart';
import 'package:client/src/model/page/login_page_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:client/src/pages/fridge_page.dart';
import 'package:client/src/pages/route/main_page.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:http/http.dart' as http;
import 'package:client/src/pages/fridge_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../flutter_flow/flutter_flow_model.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_widgets.dart';
import '../widgets/setting/kakako_button/kakako_button_widget.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  late LoginPageModel _model;

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
    _model = createModel(context, () => LoginPageModel());
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
      final apiUrl = Uri.http('api.zefridge.xyz', 'login/google');
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
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: Center(
        child: _platform != AuthorizationPlatform.none
            ? Column()
            : Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-0.4, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                        child: GradientText(
                          'Welcome ZEF,\nZero Wasted Fridge',
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Outfit',
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                          colors: [
                            FlutterFlowTheme.of(context).primaryText,
                            Color(0xFF395BA9)
                          ],
                          gradientDirection: GradientDirection.ltr,
                          gradientType: GradientType.linear,
                        ),
                      ),
                    ),
                    Stack(
                      alignment: AlignmentDirectional(0.0, -0.35),
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 10.0),
                          child: FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: '네이버로 시작하기' /* 네이버로 시작하기 */,
                            options: FFButtonOptions(
                              width: 300.0,
                              height: 44.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFF03C75A),
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Colors.white,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.7, 0.0),
                          child: Image.asset(
                            'assets/image/btnG_.png',
                            width: 32.0,
                            height: 32.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: wrapWithModel(
                        model: _model.kakakoButtonModel,
                        updateCallback: () => setState(() {}),
                        child: KakakoButtonWidget(),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        width: 300.0,
                        height: 44.0,
                        child: Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () {
                                  signInWithGoogle();
                                },
                                text: 'Sign in with Google',
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.transparent,
                                  size: 20.0,
                                ),
                                options: FFButtonOptions(
                                  width: 300.0,
                                  height: 44.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 8.0, 0.0),
                                  color: Colors.white,
                                  textStyle: GoogleFonts.getFont(
                                    'Roboto',
                                    color: Color(0xFF606060),
                                    fontSize: 17.0,
                                  ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 0.0,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-0.9, 0.0),
                              child: Container(
                                width: 22.0,
                                height: 22.0,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  'https://i0.wp.com/nanophorm.com/wp-content/uploads/2018/04/google-logo-icon-PNG-Transparent-Background.png?w=1000&ssl=1',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
      ),
    );
  }
}
