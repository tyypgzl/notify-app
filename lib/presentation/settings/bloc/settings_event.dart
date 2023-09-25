part of 'settings_bloc.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

final class TermAndConditionPressed extends SettingsEvent {
  const TermAndConditionPressed({required this.title});

  final String title;
}

final class PrivacyPolicyPressed extends SettingsEvent {
  const PrivacyPolicyPressed({required this.title});

  final String title;
}

final class LogoutButtonPressed extends SettingsEvent {}
