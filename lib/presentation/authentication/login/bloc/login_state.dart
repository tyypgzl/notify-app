part of 'login_bloc.dart';

enum LoginStatus { success, loading, error }

final class LoginState extends Equatable {
  const LoginState({
    this.status = LoginStatus.success,
    this.snackBarInfo = const SnackBarInfo.init(),
  });

  const LoginState.init() : this();

  final LoginStatus status;
  final SnackBarInfo snackBarInfo;

  bool get isLoading => status == LoginStatus.loading;
  bool get isError => status == LoginStatus.error;

  @override
  List<Object> get props => [
        status,
        snackBarInfo,
      ];

  LoginState copyWith({
    LoginStatus? status,
    SnackBarInfo? snackBarInfo,
  }) {
    return LoginState(
      status: status ?? this.status,
      snackBarInfo: snackBarInfo ?? this.snackBarInfo,
    );
  }
}
