import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:notify/config/router/app_router.dart';
import 'package:notify/utils/locator/service_locator.dart';

part 'register_event.dart';
part 'register_state.dart';

final class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState.init()) {
    on<RegisterButtonPressed>(_onRegisterButtonPressed);
    on<AlreadyHaveAnAccountButtonPressed>(_onAlreadyHaveAnAccountButtonPressed);
  }

  final formKey = GlobalKey<FormState>();
  final _router = getIt<AppRouter>();

  FutureOr<void> _onRegisterButtonPressed(
    RegisterButtonPressed event,
    Emitter<RegisterState> emit,
  ) {}

  FutureOr<void> _onAlreadyHaveAnAccountButtonPressed(
    AlreadyHaveAnAccountButtonPressed event,
    Emitter<RegisterState> emit,
  ) {
    _router.replace(const LoginRoute());
  }
}
