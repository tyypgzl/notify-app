import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:notify/data/repositories/auth/auth.dart';
import 'package:notify/utils/router/router.dart';

final class OnboardCubit extends Cubit<int> {
  OnboardCubit({
    required GoRouter router,
    required IAuthRepository authRepository,
  })  : _router = router,
        _authRepository = authRepository,
        super(0);

  final GoRouter _router;
  final IAuthRepository _authRepository;

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
    _router.go(AppRoutes.start.location);
    await _authRepository.saveOnboardStatusToDone();
  }
}
