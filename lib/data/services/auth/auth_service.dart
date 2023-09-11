import 'package:notify/core/client/cookie_client.dart';
import 'package:notify/data/models/auth/login/login_request.dart';
import 'package:notify/data/models/auth/login/login_response.dart';
import 'package:notify/data/services/auth/auth.dart';
import 'package:notify/utils/constants/api.dart';

final class AuthService implements IAuthService {
  const AuthService({
    required CookieClient client,
  }) : _client = client;

  final CookieClient _client;

  @override
  Future<LoginResponse?> login(LoginRequest request) async {
    final response = await _client.post<LoginResponse, LoginResponse>(
      ConstAPI.login,
      responseModel: const LoginResponse(),
      data: request.toJson(),
    );
    return response;
  }

  @override
  Future<LoginResponse?> register(LoginRequest request) {
    throw UnimplementedError();
  }
}
