import 'package:cookie_client/cookie_client.dart';

final class RegisterResponse implements CookieNetworkModel<RegisterResponse> {
  const RegisterResponse({
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
  RegisterResponse fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      accessToken: json['accessToken'] as String?,
      message: json['message'] as String?,
      status: json['status'] as int?,
    );
  }

  @override
  String toString() => 'RegisterResponse(accessToken: $accessToken'
      ',message: $message,status: $status)';
}
