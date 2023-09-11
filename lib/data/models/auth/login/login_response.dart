import 'package:notify/core/client/utils/model.dart';

final class LoginResponse implements CookieModel<LoginResponse> {
  const LoginResponse({
    this.accessToken,
  });

  final String? accessToken;

  @override
  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
    };
  }

  @override
  LoginResponse fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      accessToken: json['accessToken'] as String?,
    );
  }
}
