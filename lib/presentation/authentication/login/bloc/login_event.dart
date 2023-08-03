part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginButtonPressed extends LoginEvent {
  const LoginButtonPressed();

  @override
  List<Object?> get props => [];
}

class ForgotPasswordButtonPressed extends LoginEvent {
  const ForgotPasswordButtonPressed();

  @override
  List<Object?> get props => [];
}

class DontHaveAnAccountButtonPressed extends LoginEvent {
  const DontHaveAnAccountButtonPressed();

  @override
  List<Object?> get props => [];
}
