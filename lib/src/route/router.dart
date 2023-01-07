import 'dart:developer';

import 'package:client/src/common_widgets/error_page.dart';
import 'package:client/src/features/authentication/login_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Router {
  // final LoginState loginState;
  // Router(this.loginState);

  late final GoRouter _router = GoRouter(
    // refreshListenable: loginState,
    debugLogDiagnostics: true,
    urlPathStrategy: UrlPathStrategy.path,
    routes: [
      // TODO: Add Routes
      GoRoute(
          name: 'landing',
          path: '/',
          builder: (context, state) => const LogInPage(),
          redirect: (state) => state.namedLocation('logIn')),
      GoRoute(
          name: 'login',
          path: '/login',
          pageBuilder: ((context, state) =>
              MaterialPage(key: state.pageKey, child: LogInPage())))
    ],
    // TODO: ADD Error Handler
    errorPageBuilder: (context, state) => MaterialPage<void>(
      key: state.pageKey,
      child: ErrorPage(error: state.error),
    ),

    // TODO: ADD REDIRECT
  );
}
