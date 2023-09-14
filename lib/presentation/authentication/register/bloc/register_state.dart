// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'register_bloc.dart';

enum RegisterStatus { loading, success, error }

@immutable
final class RegisterState extends Equatable {
  const RegisterState({
    this.status = RegisterStatus.success,
    this.snackBarInfo = const SnackBarInfo.init(),
  });

  const RegisterState.init() : this();

  final RegisterStatus status;
  final SnackBarInfo snackBarInfo;

  bool get isLoading => status == RegisterStatus.loading;
  bool get isError => status == RegisterStatus.error;

  @override
  List<Object?> get props => [status, snackBarInfo];

  RegisterState copyWith({
    RegisterStatus? status,
    SnackBarInfo? snackBarInfo,
  }) {
    return RegisterState(
      status: status ?? this.status,
      snackBarInfo: snackBarInfo ?? this.snackBarInfo,
    );
  }
}
