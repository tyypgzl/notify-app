import 'package:app_ui/app_ui.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:notify/app/cubit/app_cubit.dart';
import 'package:notify/utils/locator/service_locator.dart';
import 'package:notify/utils/router/app_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  AppLifecycleState? state;
  final _appRouter = getIt<AppRouter>();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    this.state = state;
    AppLogger.logInfo('LifeCycle: $state');
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, appState) {
        return ResponsiveSizer(
          builder: (context, orientation, screenType) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: AppConstants.name,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: appState.locale,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              routeInformationProvider: _appRouter.routeInfoProvider(),
              routerDelegate: _appRouter.delegate(),
              routeInformationParser: _appRouter.defaultRouteParser(),
              themeMode: appState.themeMode,
              theme: FlexThemeData.light(
                scheme: FlexScheme.brandBlue,
                appBarStyle: FlexAppBarStyle.primary,
                fontFamily: FontFamily.poppins,
                subThemesData: const FlexSubThemesData(
                  inputDecoratorRadius: 4,
                  inputDecoratorBorderType: FlexInputBorderType.underline,
                ),
              ),
              // The Mandy red, dark theme.
              darkTheme: FlexThemeData.dark(
                scheme: FlexScheme.aquaBlue,
                appBarStyle: FlexAppBarStyle.primary,
                fontFamily: FontFamily.poppins,
                subThemesData: const FlexSubThemesData(
                  inputDecoratorRadius: 4,
                  inputDecoratorBorderType: FlexInputBorderType.underline,
                ),
              ),
              builder: (BuildContext context, Widget? widget) {
                ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
                  return ErrorView(
                    message: errorDetails.toString(),
                    stackTrace: errorDetails.stack,
                  );
                };
                return widget!;
              },
            );
          },
        );
      },
    );
  }
}
