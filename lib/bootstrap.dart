import 'dart:async';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:notify/app/cubit/app_cubit.dart';
import 'package:notify/app/observer/bloc_observer.dart';
import 'package:notify/app/view/app.dart';
import 'package:notify/core/client/cookie_client.dart';
import 'package:notify/data/repositories/auth/auth.dart';
import 'package:notify/data/services/auth/auth.dart';
import 'package:notify/utils/enum/flavor.dart';
import 'package:notify/utils/flavor/flavor_config.dart';
import 'package:notify/utils/locator/service_locator.dart';
import 'package:notify/utils/storage/persistent_storage.dart';
import 'package:notify/utils/storage/secure_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> bootstrap(Flavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  final sharedPreferences = await SharedPreferences.getInstance();
  final directory = await getApplicationDocumentsDirectory();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: directory,
  );

  setUp(sharedPreferences: sharedPreferences);
  AppLogger.getInstance();
  Bloc.observer = AppBlocObserver();
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<IAuthRepository>(
          create: (context) => AuthRepository(
            authService: AuthService(
              client: getIt<CookieClient>(),
            ),
            persistentStorage: getIt<PersistentStorage>(),
            secureStorage: getIt<SecureStorage>(),
          ),
        ),
      ],
      child: FlavorConfig(
        flavor: flavor,
        child: MultiBlocProvider(
          providers: [
            BlocProvider<AppCubit>(
              create: (context) => AppCubit(),
            ),
          ],
          child: const App(),
        ),
      ),
    ),
  );
}
