import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:notify/utils/locator/service_locator.dart';
import 'package:notify/utils/router/router.dart';

part 'register_event.dart';
part 'register_state.dart';

final class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState.init()) {
    on<RegisterButtonPressed>(_onRegisterButtonPressed);
    on<AlreadyHaveAnAccountButtonPressed>(_onAlreadyHaveAnAccountButtonPressed);
    on<RegisterBackButtonPressed>(_onRegisterBackButtonPressed);
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
    _router.replaceNamed(AppRoutes.login.path);
  }

  FutureOr<void> _onRegisterBackButtonPressed(
    RegisterBackButtonPressed event,
    Emitter<RegisterState> emit,
  ) {
    _router.back();
  }
}
