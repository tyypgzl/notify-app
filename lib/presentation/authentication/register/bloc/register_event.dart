part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object?> get props => [];
}

class RegisterButtonPressed extends RegisterEvent {
  const RegisterButtonPressed();

  @override
  List<Object?> get props => [];
}

class AlreadyHaveAnAccountButtonPressed extends RegisterEvent {
  const AlreadyHaveAnAccountButtonPressed();

  @override
  List<Object?> get props => [];
}
