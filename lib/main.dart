import 'package:client/src/controller/food_controller.dart';
import 'package:client/src/pages/login_page.dart';
import 'package:client/src/pages/fridge_page.dart';
import 'package:client/src/pages/route/main_page.dart';
import 'package:client/src/pages/route/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: 'assets/config/.env');
  KakaoSdk.init(nativeAppKey: dotenv.env['KAKAO_KEY']);
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => FoodNotifier())],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        '/': (context) => const LogInPage(),
        '/main': (context) => const MainPage()
      },
    );
  }
}
