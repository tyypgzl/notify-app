import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:notify/data/repositories/auth/auth.dart';
import 'package:notify/router/router.dart';
import 'package:notify/utils/locator/service_locator.dart';

final class OnboardCubit extends Cubit<int> {
  OnboardCubit({
    required IAuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(0);

  final IAuthRepository _authRepository;
  final _router = getIt<AppRouter>();

  final pageController = PageController();

  void onPageChanged(int value) => emit(value);

  void skipButtonPressed() => _navigate();

  Future<void> backButtonPressed() async {
    await pageController.previousPage(
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
    );
  }

  Future<void> nextButtonPressed() async {
    if (state == 2) {
      await _navigate();
    } else {
      await pageController.nextPage(
        duration: const Duration(milliseconds: 200),
        curve: Curves.linear,
      );
    }
  }

  Future<void> _navigate() async {
    unawaited(_router.replaceNamed(AppRoutes.start.path));
    await _authRepository.saveOnboardStatusToDone();
  }
}
