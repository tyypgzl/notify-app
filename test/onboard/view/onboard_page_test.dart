// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:notify/presentation/authentication/onboard/onboard.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OnboardPage', () {
    group('route', () {
      test('is routable', () {
        expect(OnboardPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders OnboardView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: OnboardPage()));
      expect(find.byType(OnboardView), findsOneWidget);
    });
  });
}
