import 'package:notify/core/client/utils/model.dart';

final class LoginResponse implements CookieModel<LoginResponse> {
  const LoginResponse({
    this.accessToken,
    this.message,
    this.status,
  });

  final String? accessToken;
  final String? message;
  final int? status;

  @override
  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'message': message,
      'status': status,
    };
  }

  @override
  LoginResponse fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      accessToken: json['accessToken'] as String?,
      message: json['message'] as String?,
      status: json['status'] as int?,
    );
  }
}
