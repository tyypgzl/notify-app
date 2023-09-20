import 'package:cookie_client/cookie_client.dart';

final class LoginRequest implements CookieNetworkModel<LoginRequest> {
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
