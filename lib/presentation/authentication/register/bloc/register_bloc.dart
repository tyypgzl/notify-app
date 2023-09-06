import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notify/presentation/authentication/login/login.dart';

part 'register_event.dart';

part 'register_state.dart';

final class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc(GoRouter router)
      : _router = router,
        super(const RegisterState.init()) {
    on<RegisterButtonPressed>(_onRegisterButtonPressed);
    on<AlreadyHaveAnAccountButtonPressed>(_onAlreadyHaveAnAccountButtonPressed);
  }

  final GoRouter _router;
  final formKey = GlobalKey<FormState>();

  FutureOr<void> _onRegisterButtonPressed(
    RegisterButtonPressed event,
    Emitter<RegisterState> emit,
  ) {}

  FutureOr<void> _onAlreadyHaveAnAccountButtonPressed(
    AlreadyHaveAnAccountButtonPressed event,
    Emitter<RegisterState> emit,
  ) {
    _router.pushReplacement(LoginPage.location);
  }
}
