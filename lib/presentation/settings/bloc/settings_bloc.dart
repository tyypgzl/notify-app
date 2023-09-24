import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notify/data/repositories/auth/auth.dart';
import 'package:notify/router/router.dart';
import 'package:notify/utils/exception/notify_exception.dart';
import 'package:notify/utils/locator/service_locator.dart';

part 'settings_event.dart';
part 'settings_state.dart';

final class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc({required IAuthRepository authRepository})
      : _authRepository = authRepository,
        super(const SettingsState.init()) {
    on<LogoutButtonPressed>(_onLogoutButtonPressed);
  }

  final IAuthRepository _authRepository;
  final _router = getIt<AppRouter>();

  Future<FutureOr<void>> _onLogoutButtonPressed(
    LogoutButtonPressed event,
    Emitter<SettingsState> emit,
  ) async {
    try {
      emit(state.copyWith(status: SettingsStatus.loading));
      await _authRepository.logout();
      emit(state.copyWith(status: SettingsStatus.success));
      unawaited(_router.replaceAll([const StartRoute()]));
    } on NotifyException catch (error, stackTrace) {
      emit(state.copyWith(status: SettingsStatus.error));
      addError(error, stackTrace);
    }
  }
}
