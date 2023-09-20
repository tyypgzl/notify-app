import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:storage/storage.dart';

class MockSecurePreferences extends Mock implements FlutterSecureStorage {}

void main() {
  group('Secure Storage', () {
    late SecureStorage secureStorage;

    setUp(() async {
      secureStorage = SecureStorage(MockSecurePreferences());
    });
    test('can be instantiated', () {
      expect(
        secureStorage,
        isNotNull,
      );
    });
  });
}
