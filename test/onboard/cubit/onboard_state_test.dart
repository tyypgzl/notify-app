// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:notify/presentation/authentication/onboard/cubit/cubit.dart';

void main() {
  group('OnboardState', () {
    test('supports value equality', () {
      expect(
        OnboardState(),
        equals(
          const OnboardState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const OnboardState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const onboardState = OnboardState(
            customProperty: 'My property',
          );
          expect(
            onboardState.copyWith(),
            equals(onboardState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const onboardState = OnboardState(
            customProperty: 'My property',
          );
          final otherOnboardState = OnboardState(
            customProperty: 'My property 2',
          );
          expect(onboardState, isNot(equals(otherOnboardState)));

          expect(
            onboardState.copyWith(
              customProperty: otherOnboardState.customProperty,
            ),
            equals(otherOnboardState),
          );
        },
      );
    });
  });
}
