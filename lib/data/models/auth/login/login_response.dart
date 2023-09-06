final class LoginResponse {
  const LoginResponse({
    this.accessToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      accessToken: json['accessToken'] as String?,
    );
  }

  final String? accessToken;

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
    };
  }
}
