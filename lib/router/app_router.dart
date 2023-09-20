import 'package:auto_route/auto_route.dart';
import 'package:notify/presentation/authentication/login/login.dart';
import 'package:notify/presentation/authentication/register/register.dart';
import 'package:notify/presentation/authentication/start/start.dart';
import 'package:notify/presentation/dashboard/dashboard.dart';
import 'package:notify/presentation/note/note.dart';
import 'package:notify/presentation/onboard/onboard.dart';
import 'package:notify/presentation/settings/settings.dart';
import 'package:notify/presentation/splash/splash.dart';
import 'package:notify/presentation/task/task.dart';
import 'package:notify/presentation/todo/todo.dart';
import 'package:notify/router/router.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'View|Page|Screen|Widget,Route',
)
final class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          path: AppRoutes.splash.path,
        ),
        AutoRoute(
          page: OnboardRoute.page,
          path: AppRoutes.onboard.path,
        ),
        AutoRoute(
          page: StartRoute.page,
          path: AppRoutes.start.path,
        ),
        AutoRoute(
          page: LoginRoute.page,
          path: AppRoutes.login.path,
        ),
        AutoRoute(
          page: RegisterRoute.page,
          path: AppRoutes.register.path,
        ),
        AutoRoute(
          page: DashboardRoute.page,
          path: AppRoutes.dashboard.path,
          children: [
            AutoRoute(
              page: TodoRoute.page,
              path: AppRoutes.todo.path,
            ),
            AutoRoute(
              page: TaskRoute.page,
              path: AppRoutes.task.path,
            ),
            AutoRoute(
              page: NoteRoute.page,
              path: AppRoutes.note.path,
            ),
            AutoRoute(
              page: SettingsRoute.page,
              path: AppRoutes.settings.path,
            ),
          ],
        ),
      ];
}
