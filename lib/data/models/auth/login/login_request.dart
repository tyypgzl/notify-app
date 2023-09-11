import 'package:notify/core/client/utils/utils.dart';

final class LoginRequest implements CookieModel<LoginRequest> {
  const LoginRequest({
    this.email,
    this.password,
  });

  final String? email;
  final String? password;

  @override
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  @override
  LoginRequest fromJson(Map<String, dynamic> json) {
    return LoginRequest(
      email: json['email'] as String?,
      password: json['password'] as String?,
    );
  }
}
