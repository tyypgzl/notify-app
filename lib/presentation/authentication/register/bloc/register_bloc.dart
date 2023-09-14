import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notify/core/exception/notify_exception.dart';
import 'package:notify/data/models/auth/register/register.dart';
import 'package:notify/data/repositories/auth/auth.dart';
import 'package:notify/presentation/widgets/widgets.dart';
import 'package:notify/utils/locator/service_locator.dart';
import 'package:notify/utils/router/router.dart';

part 'register_event.dart';
part 'register_state.dart';

final class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc({required IAuthRepository authRepository})
      : _authRepository = authRepository,
        super(const RegisterState.init()) {
    on<RegisterButtonPressed>(_onRegisterButtonPressed);
    on<AlreadyHaveAnAccountButtonPressed>(_onAlreadyHaveAnAccountButtonPressed);
    on<RegisterBackButtonPressed>(_onRegisterBackButtonPressed);
    on<ResetRegisterSnackBar>(_onResetRegisterSnackBar);
  }

  final IAuthRepository _authRepository;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _router = getIt<AppRouter>();

  FutureOr<void> _onRegisterButtonPressed(
    RegisterButtonPressed event,
    Emitter<RegisterState> emit,
  ) async {
    try {
      await SystemChannels.textInput.invokeMethod('TextInput.hide');
      if (formKey.currentState?.validate() ?? false) {
        emit(state.copyWith(status: RegisterStatus.loading));
        final request = RegisterRequest(
          email: emailController.text,
          password: passwordController.text,
        );
        final result = await _authRepository.register(request);

        emit(state.copyWith(status: RegisterStatus.success));
        await _authRepository.saveAccessToken(result?.accessToken);
        unawaited(_router.replaceAll([const HomeRoute()]));
      }
    } on NotifyException catch (error, stacktrace) {
      emit(
        state.copyWith(
          status: RegisterStatus.error,
          snackBarInfo: SnackBarInfo(
            type: SnackBarType.error,
            showSnackBar: true,
            message: error.message,
          ),
        ),
      );

      addError(error, stacktrace);
    }
  }

  FutureOr<void> _onAlreadyHaveAnAccountButtonPressed(
    AlreadyHaveAnAccountButtonPressed event,
    Emitter<RegisterState> emit,
  ) {
    _router.replaceNamed(AppRoutes.login.path);
  }

  FutureOr<void> _onRegisterBackButtonPressed(
    RegisterBackButtonPressed event,
    Emitter<RegisterState> emit,
  ) {
    _router.back();
  }

  FutureOr<void> _onResetRegisterSnackBar(
    ResetRegisterSnackBar event,
    Emitter<RegisterState> emit,
  ) {
    emit(
      state.copyWith(
        snackBarInfo: const SnackBarInfo.init(),
      ),
    );
  }
}
