import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:notify/config/locator/service_locator.dart';
import 'package:notify/config/router/app_router.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState.init()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
    on<ForgotPasswordButtonPressed>(_onForgotPasswordButtonPressed);
    on<DontHaveAnAccountButtonPressed>(_onDontHaveAnAccountButtonPressed);
  }

  final formKey = GlobalKey<FormState>();

  final _router = getIt<AppRouter>();

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
    _router.replace(const RegisterRoute());
  }
}
