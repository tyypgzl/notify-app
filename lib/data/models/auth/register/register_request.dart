import 'package:notify/core/client/utils/utils.dart';

final class RegisterRequest implements CookieModel<RegisterRequest> {
  const RegisterRequest({
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
  RegisterRequest fromJson(Map<String, dynamic> json) {
    return RegisterRequest(
      email: json['email'] as String?,
      password: json['password'] as String?,
    );
  }

  @override
  String toString() => 'RegisterRequest(email: $email,password: $password)';
}
