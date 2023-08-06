part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object?> get props => [];
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
