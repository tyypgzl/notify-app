import 'package:shared_preferences/shared_preferences.dart';

final class PersistentStorageException implements Exception {
  const PersistentStorageException(this.error);

  final Object error;
}

final class PersistentStorage {
  const PersistentStorage({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;

  Future<String?> read({required String key}) async {
    try {
      return _sharedPreferences.getString(key);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(PersistentStorageException(error), stackTrace);
    }
  }

  Future<void> write({required String key, required String value}) async {
    try {
      await _sharedPreferences.setString(key, value);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(PersistentStorageException(error), stackTrace);
    }
  }

  Future<void> delete({required String key}) async {
    try {
      await _sharedPreferences.remove(key);
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(PersistentStorageException(error), stackTrace);
    }
  }

  Future<void> clear() async {
    try {
      await _sharedPreferences.clear();
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(PersistentStorageException(error), stackTrace);
    }
  }
}
