import 'dart:async';

import 'package:storage/storage.dart';

/// {@template memory_storage}
/// Storage that saves data in the device's memory.
/// {@endtemplate}
class MemoryStorage extends Storage {
  /// {@macro memory_storage}
  MemoryStorage() : _storage = <String, String>{};

  final Map<String, String> _storage;

  @override
  FutureOr<void> clear() {
    _storage.clear();
  }

  @override
  FutureOr<void> delete({required String key}) {
    _storage.remove(key);
  }

  @override
  FutureOr<String?> read({required String key}) {
    return _storage[key];
  }

  @override
  FutureOr<void> write({required String key, required String value}) {
    _storage[key] = value;
  }
}
