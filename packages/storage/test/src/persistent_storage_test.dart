import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storage/storage.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  group('Persistent Storage', () {
    late SharedPreferences sharedPreferences;
    late PersistentStorage persistentStorage;

    setUp(() async {
      sharedPreferences = MockSharedPreferences();
      persistentStorage =
          PersistentStorage(sharedPreferences: sharedPreferences);
    });
    test('can be instantiated', () {
      expect(
        persistentStorage,
        isNotNull,
      );
    });
  });
}
