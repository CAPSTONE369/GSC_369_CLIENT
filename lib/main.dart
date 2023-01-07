import 'package:client/src/features/authentication/login_page.dart';
import 'package:client/src/features/food_fridge/fridge_page.dart';
import 'package:client/src/route/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  KakaoSdk.init(nativeAppKey: '네이티브 앱 키');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const LogInPage(),
        '/food': (context) => const FridgePage()
      },
    );
  }
}
