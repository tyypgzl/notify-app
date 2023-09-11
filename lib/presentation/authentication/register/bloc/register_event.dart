part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();
}

final class RegisterButtonPressed extends RegisterEvent {
  const RegisterButtonPressed();

  @override
  List<Object?> get props => [];
}

final class AlreadyHaveAnAccountButtonPressed extends RegisterEvent {
  const AlreadyHaveAnAccountButtonPressed();

  @override
  List<Object?> get props => [];
}

final class RegisterBackButtonPressed extends RegisterEvent {
  const RegisterBackButtonPressed();

  @override
  List<Object?> get props => [];
}
