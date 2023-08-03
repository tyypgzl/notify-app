// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:notify/presentation/authentication/onboard/onboard.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OnboardBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => OnboardCubit(),
          child: MaterialApp(home: OnboardBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
