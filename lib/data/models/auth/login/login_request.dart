final class LoginRequest {
  const LoginRequest({
    this.email,
    this.password,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) {
    return LoginRequest(
      email: json['email'] as String?,
      password: json['password'] as String?,
    );
  }

  final String? email;
  final String? password;

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
