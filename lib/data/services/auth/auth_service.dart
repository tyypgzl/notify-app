import 'package:cookie_client/cookie_client.dart';
import 'package:notify/data/models/auth/login/login_request.dart';
import 'package:notify/data/models/auth/login/login_response.dart';
import 'package:notify/data/models/auth/register/register.dart';
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
  Future<RegisterResponse?> register(RegisterRequest request) async {
    final response = await _client.post<RegisterResponse, RegisterResponse>(
      ConstAPI.register,
      responseModel: const RegisterResponse(),
      data: request.toJson(),
    );
    return response;
  }
}
