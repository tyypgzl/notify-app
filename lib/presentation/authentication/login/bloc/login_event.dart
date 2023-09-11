part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();
}

final class LoginButtonPressed extends LoginEvent {
  const LoginButtonPressed();

  @override
  List<Object?> get props => [];
}

final class ForgotPasswordButtonPressed extends LoginEvent {
  const ForgotPasswordButtonPressed();

  @override
  List<Object?> get props => [];
}

final class DontHaveAnAccountButtonPressed extends LoginEvent {
  const DontHaveAnAccountButtonPressed();

  @override
  List<Object?> get props => [];
}

final class LoginBackButtonPressed extends LoginEvent {
  @override
  List<Object?> get props => [];
}

final class ResetLoginSnackBar extends LoginEvent {
  @override
  List<Object?> get props => [];
}
