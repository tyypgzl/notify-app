import 'dart:async';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:notify/app/cubit/app_cubit.dart';
import 'package:notify/app/observer/bloc_observer.dart';
import 'package:notify/app/view/app.dart';
import 'package:notify/config/flavor/flavor_config.dart';
import 'package:notify/config/locator/service_locator.dart';
import 'package:notify/utils/enum/flavor.dart';
import 'package:path_provider/path_provider.dart';

Future<void> bootstrap(Flavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  final directory = await getApplicationDocumentsDirectory();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: directory,
  );

  setUp();
  AppLogger.getInstance();
  Bloc.observer = AppBlocObserver();
  runApp(
    FlavorConfig(
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
  );
}
