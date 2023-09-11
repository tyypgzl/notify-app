import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:notify/core/exception/notify_exception.dart';
import 'package:notify/data/models/auth/login/login.dart';
import 'package:notify/data/repositories/auth/auth.dart';
import 'package:notify/presentation/widgets/widgets.dart';
import 'package:notify/utils/router/router.dart';

part 'login_event.dart';
part 'login_state.dart';

final class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required GoRouter router,
    required IAuthRepository authRepository,
  })  : _router = router,
        _authRepository = authRepository,
        super(const LoginState.init()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
    on<ForgotPasswordButtonPressed>(_onForgotPasswordButtonPressed);
    on<DontHaveAnAccountButtonPressed>(_onDontHaveAnAccountButtonPressed);
    on<ResetLoginSnackBar>(_onResetLoginSnackBar);
  }

  final GoRouter _router;
  final IAuthRepository _authRepository;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  FutureOr<void> _onLoginButtonPressed(
    LoginButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    try {
      if (formKey.currentState?.validate() ?? false) {
        emit(state.copyWith(status: LoginStatus.loading));
        await SystemChannels.textInput.invokeMethod('TextInput.hide');
        final request = LoginRequest(
          email: emailController.text,
          password: passwordController.text,
        );
        final response = await _authRepository.login(request);
        await _authRepository.saveAccessToken(response?.accessToken);
        emit(state.copyWith(status: LoginStatus.success));
        unawaited(_router.replace(AppRoutes.home.location));
      }
    } on NotifyException catch (error, stacktrace) {
      emit(
        state.copyWith(
          status: LoginStatus.error,
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

  FutureOr<void> _onForgotPasswordButtonPressed(
    ForgotPasswordButtonPressed event,
    Emitter<LoginState> emit,
  ) {}

  FutureOr<void> _onDontHaveAnAccountButtonPressed(
    DontHaveAnAccountButtonPressed event,
    Emitter<LoginState> emit,
  ) {
    _router.pushReplacement(AppRoutes.register.location);
  }

  FutureOr<void> _onResetLoginSnackBar(
    ResetLoginSnackBar event,
    Emitter<LoginState> emit,
  ) {
    emit(
      state.copyWith(
        snackBarInfo: const SnackBarInfo.init(),
      ),
    );
  }
}
