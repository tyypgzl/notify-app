import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:notify/presentation/authentication/login/login.dart';
import 'package:notify/presentation/authentication/register/register.dart';
import 'package:notify/presentation/authentication/start/view/start_page.dart';
import 'package:notify/presentation/onboard/onboard.dart';
import 'package:notify/presentation/splash/splash.dart';

final class AppRouter {
  static GoRouter get goRouter => GoRouter(
        debugLogDiagnostics: kDebugMode,
        initialLocation: SplashPage.location,
        routes: <RouteBase>[
          GoRoute(
            name: SplashPage.name,
            path: SplashPage.location,
            builder: (context, state) => const SplashPage(),
          ),
          GoRoute(
            name: OnboardPage.name,
            path: OnboardPage.location,
            builder: (context, state) => const OnboardPage(),
          ),
          GoRoute(
            name: StartPage.name,
            path: StartPage.location,
            builder: (context, state) => const StartPage(),
          ),
          GoRoute(
            name: LoginPage.name,
            path: LoginPage.location,
            builder: (context, state) => const LoginPage(),
          ),
          GoRoute(
            name: RegisterPage.name,
            path: RegisterPage.location,
            builder: (context, state) => const RegisterPage(),
          ),
        ],
      );
}
