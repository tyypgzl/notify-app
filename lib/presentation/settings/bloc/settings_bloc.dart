import 'dart:async';
import 'dart:convert';

import 'package:app_ui/app_ui.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notify/data/repositories/auth/auth.dart';
import 'package:notify/router/router.dart';
import 'package:notify/utils/constants/constants.dart';
import 'package:notify/utils/exception/notify_exception.dart';
import 'package:notify/utils/locator/service_locator.dart';

part 'settings_event.dart';
part 'settings_state.dart';

final class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc({required IAuthRepository authRepository})
      : _authRepository = authRepository,
        super(const SettingsState.init()) {
    on<TermAndConditionPressed>(_onTermAndConditionPressed);
    on<PrivacyPolicyPressed>(_onPrivacyPolicyPressed);
    on<LogoutButtonPressed>(_onLogoutButtonPressed);
  }

  final IAuthRepository _authRepository;
  final _router = getIt<AppRouter>();

  FutureOr<void> _onTermAndConditionPressed(
    TermAndConditionPressed event,
    Emitter<SettingsState> emit,
  ) {
    _router.pushWidget(
      BasicWebView(
        uri: Uri.dataFromString(
          ConstGeneral.termAndConditions2,
          encoding: Encoding.getByName('utf-8'),
          mimeType: 'text/html',
        ),
        title: event.title,
      ),
    );
  }

  FutureOr<void> _onPrivacyPolicyPressed(
    PrivacyPolicyPressed event,
    Emitter<SettingsState> emit,
  ) {
    _router.pushWidget(
      BasicWebView(
        uri: Uri.dataFromString(
          ConstGeneral.privacyPolicy,
          encoding: Encoding.getByName('utf-8'),
          mimeType: 'text/html',
        ),
        title: event.title,
      ),
    );
  }

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
