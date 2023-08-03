import 'package:auto_route/auto_route.dart';
import 'package:notify/presentation/authentication/login/login.dart';
import 'package:notify/presentation/authentication/register/register.dart';
import 'package:notify/presentation/authentication/start/view/start_page.dart';
import 'package:notify/presentation/onboard/onboard.dart';
import 'package:notify/presentation/splash/splash.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'View|Page|Screen|Widget,Route',
)
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: SplashRoute.page, path: SplashPage.name),
    AutoRoute(page: OnboardRoute.page, path: OnboardPage.name),
    AutoRoute(page: StartRoute.page, path: StartPage.name),
    AutoRoute(page: LoginRoute.page, path: LoginPage.name),
    AutoRoute(page: RegisterRoute.page, path: RegisterPage.name),
  ];
}
