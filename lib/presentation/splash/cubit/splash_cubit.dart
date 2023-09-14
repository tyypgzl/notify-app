import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notify/data/repositories/auth/auth.dart';
import 'package:notify/utils/locator/service_locator.dart';
import 'package:notify/utils/router/router.dart';

part 'splash_state.dart';

final class SplashCubit extends Cubit<SplashState> {
  SplashCubit({
    required IAuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(const SplashState.init());

  final IAuthRepository _authRepository;
  final _router = getIt<AppRouter>();

  Future<void> navigate() async {
    final onboardStatus = await _authRepository.readOnboardStatus();
    if (onboardStatus != null) {
      final accessToken = await _authRepository.readAccessToken();
      if (accessToken != null) {
        unawaited(_router.replaceNamed(AppRoutes.dashboard.path));
      } else {
        unawaited(_router.replaceNamed(AppRoutes.start.path));
      }
    } else {
      unawaited(_router.replaceNamed(AppRoutes.onboard.path));
    }
  }
}
