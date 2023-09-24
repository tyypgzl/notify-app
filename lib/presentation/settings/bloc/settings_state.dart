part of 'settings_bloc.dart';

enum SettingsStatus { loading, success, error }

final class SettingsState extends Equatable {
  const SettingsState({
    this.status = SettingsStatus.success,
  });

  const SettingsState.init() : this();

  final SettingsStatus status;

  bool get isLoding => status == SettingsStatus.loading;

  @override
  List<Object> get props => [status];

  SettingsState copyWith({
    SettingsStatus? status,
  }) {
    return SettingsState(
      status: status ?? this.status,
    );
  }
}
