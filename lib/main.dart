import 'package:client/src/features/authentication/login_page.dart';
import 'package:client/src/features/food_fridge/fridge_page.dart';
import 'package:flutter/material.dart';

void main() {
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
