import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:notify/core/client/cookie_client.dart';
import 'package:notify/core/client/utils/logger.dart';
import 'package:notify/utils/constants/api.dart';
import 'package:notify/utils/storage/persistent_storage.dart';
import 'package:notify/utils/storage/secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

void setUp({
  required SharedPreferences sharedPreferences,
}) {
  const secureStorage = SecureStorage(FlutterSecureStorage());
  final persistentStorage =
      PersistentStorage(sharedPreferences: sharedPreferences);

  final client = CookieClient(
    baseUrl: ConstAPI.baseUrl,
    logger: const CookieLogger.all(),
  );

  getIt
    ..registerSingleton<SecureStorage>(secureStorage)
    ..registerSingleton<PersistentStorage>(persistentStorage)
    ..registerSingleton<CookieClient>(client);
}
