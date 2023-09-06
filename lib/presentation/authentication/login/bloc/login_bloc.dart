import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notify/presentation/authentication/register/register.dart';

part 'login_event.dart';

part 'login_state.dart';

final class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(GoRouter router)
      : _router = router,
        super(const LoginState.init()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
    on<ForgotPasswordButtonPressed>(_onForgotPasswordButtonPressed);
    on<DontHaveAnAccountButtonPressed>(_onDontHaveAnAccountButtonPressed);
  }

  final GoRouter _router;
  final formKey = GlobalKey<FormState>();

  FutureOr<void> _onLoginButtonPressed(
    LoginButtonPressed event,
    Emitter<LoginState> emit,
  ) {
    FocusManager.instance.primaryFocus?.unfocus();
    formKey.currentState?.validate();

    try {
// async func to auth repo
    } catch (error, stacktrace) {
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
    _router.pushReplacement(RegisterPage.location);
  }
}
