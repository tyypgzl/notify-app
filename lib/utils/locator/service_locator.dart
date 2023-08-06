import 'package:get_it/get_it.dart';
import 'package:notify/config/router/app_router.dart';

final getIt = GetIt.instance;

void setUp() {
  getIt.registerSingleton<AppRouter>(AppRouter());
}
