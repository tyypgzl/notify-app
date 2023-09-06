import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
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

  getIt
    ..registerSingleton<SecureStorage>(secureStorage)
    ..registerSingleton<PersistentStorage>(persistentStorage);
}
