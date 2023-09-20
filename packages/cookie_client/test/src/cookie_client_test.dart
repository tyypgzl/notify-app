import 'package:cookie_client/cookie_client.dart';
import 'package:flutter_test/flutter_test.dart';

const jsonPlaceHolderBaseURL = 'https://jsonplaceholder.typicode.com';

void main() {
  group('CookieClient', () {
    test('can be instantiated', () {
      expect(CookieClient(baseUrl: jsonPlaceHolderBaseURL), isNotNull);
    });
  });
}
