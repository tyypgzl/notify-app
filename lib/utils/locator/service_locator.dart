import 'package:cookie_client/cookie_client.dart';
import 'package:get_it/get_it.dart';
import 'package:notify/router/app_router.dart';
import 'package:notify/utils/constants/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storage/storage.dart';

final getIt = GetIt.instance;

void setUp({
  required SharedPreferences sharedPreferences,
}) {
  const secureStorage = SecureStorage();
  final persistentStorage =
      PersistentStorage(sharedPreferences: sharedPreferences);

  final router = AppRouter();

  final client = CookieClient(
    baseUrl: ConstAPI.baseUrl,
    logger: const CookieLogger.all(),
  );

  getIt
    ..registerSingleton<SecureStorage>(secureStorage)
    ..registerSingleton<PersistentStorage>(persistentStorage)
    ..registerSingleton<CookieClient>(client)
    ..registerSingleton<AppRouter>(router);
}
