import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:notify/presentation/authentication/login/login.dart';
import 'package:notify/presentation/authentication/register/register.dart';
import 'package:notify/presentation/authentication/start/view/start_page.dart';
import 'package:notify/presentation/home/view/home_page.dart';
import 'package:notify/presentation/onboard/onboard.dart';
import 'package:notify/presentation/splash/splash.dart';
import 'package:notify/utils/router/router.dart';

final class AppRouter {
  static GoRouter get goRouter => GoRouter(
        debugLogDiagnostics: kDebugMode,
        initialLocation: AppRoutes.splash.location,
        routes: <RouteBase>[
          GoRoute(
            name: AppRoutes.splash.name,
            path: AppRoutes.splash.location,
            builder: (context, state) => const SplashPage(),
          ),
          GoRoute(
            name: AppRoutes.onboard.name,
            path: AppRoutes.onboard.location,
            builder: (context, state) => const OnboardPage(),
          ),
          GoRoute(
            name: AppRoutes.start.name,
            path: AppRoutes.start.location,
            builder: (context, state) => const StartPage(),
          ),
          GoRoute(
            name: AppRoutes.login.name,
            path: AppRoutes.login.location,
            builder: (context, state) => const LoginPage(),
          ),
          GoRoute(
            name: AppRoutes.register.name,
            path: AppRoutes.register.location,
            builder: (context, state) => const RegisterPage(),
          ),
          GoRoute(
            name: AppRoutes.home.name,
            path: AppRoutes.home.location,
            builder: (context, state) => const HomePage(),
          ),
        ],
      );
}
