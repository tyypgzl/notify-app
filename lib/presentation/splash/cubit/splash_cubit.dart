import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:go_router/go_router.dart';
import 'package:notify/data/repositories/auth/auth.dart';
import 'package:notify/utils/router/router.dart';

part 'splash_state.dart';

final class SplashCubit extends Cubit<SplashState> {
  SplashCubit({
    required GoRouter router,
    required IAuthRepository authRepository,
  })  : _authRepository = authRepository,
        _router = router,
        super(const SplashState.init());

  final GoRouter _router;
  final IAuthRepository _authRepository;

  Future<void> navigate() async {
    final onboardStatus = await _authRepository.readOnboardStatus();
    if (onboardStatus != null) {
      final accessToken = await _authRepository.readAccessToken();
      if (accessToken != null) {
        unawaited(_router.replace<void>(AppRoutes.home.location));
      }
      unawaited(_router.replace<void>(AppRoutes.start.location));
    } else {
      unawaited(_router.replace<void>(AppRoutes.onboard.location));
    }
  }
}
