import 'package:notify/data/models/auth/login/login.dart';
import 'package:notify/data/models/auth/register/register.dart';

abstract interface class IAuthRepository {
  Future<LoginResponse?> login(LoginRequest request);
  Future<RegisterResponse?> register(RegisterRequest request);

  Future<void> saveOnboardStatusToDone();
  Future<String?> readOnboardStatus();
  Future<String?> readAccessToken();
  Future<void> saveAccessToken(String? accessToken);
}
