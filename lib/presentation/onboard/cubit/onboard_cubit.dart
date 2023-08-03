import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:notify/config/locator/service_locator.dart';
import 'package:notify/config/router/app_router.dart';

class OnboardCubit extends Cubit<int> {
  OnboardCubit() : super(0);

  final pageController = PageController();
  final _router = getIt<AppRouter>();

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
      _navigate();
    } else {
      await pageController.nextPage(
        duration: const Duration(milliseconds: 200),
        curve: Curves.linear,
      );
    }
  }

  void _navigate() {
    _router.push(const StartRoute());
  }
}
