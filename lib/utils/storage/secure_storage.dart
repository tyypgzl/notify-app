import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final class SecureStorageException implements Exception {
  const SecureStorageException(this.error);

  final Object error;
}

final class SecureStorage {
  const SecureStorage([FlutterSecureStorage? secureStorage])
      : _secureStorage = secureStorage ?? const FlutterSecureStorage();

  final FlutterSecureStorage _secureStorage;

  Future<String?> read({required String key}) async {
    try {
      final result = await _secureStorage.read(key: key);
      return result;
    } on Exception catch (error, stackTrace) {
      Error.throwWithStackTrace(SecureStorageException(error), stackTrace);
    }
  }

  Future<void> write({required String key, required String? value}) async {
    try {
      await _secureStorage.write(key: key, value: value);
    } on Exception catch (error, stackTrace) {
      Error.throwWithStackTrace(SecureStorageException(error), stackTrace);
    }
  }

  Future<void> delete({required String key}) async {
    try {
      await _secureStorage.delete(key: key);
    } on Exception catch (error, stackTrace) {
      Error.throwWithStackTrace(SecureStorageException(error), stackTrace);
    }
  }

  Future<void> clear() async {
    try {
      await _secureStorage.deleteAll();
    } on Exception catch (error, stackTrace) {
      Error.throwWithStackTrace(SecureStorageException(error), stackTrace);
    }
  }

  Future<Map<String, String>> readAll() async {
    try {
      return await _secureStorage.readAll();
    } on Exception catch (error, stackTrace) {
      Error.throwWithStackTrace(SecureStorageException(error), stackTrace);
    }
  }

  Future<bool?> contains({required String key}) async {
    try {
      return await _secureStorage.containsKey(key: key);
    } on Exception catch (error, stackTrace) {
      Error.throwWithStackTrace(SecureStorageException(error), stackTrace);
    }
  }
}
