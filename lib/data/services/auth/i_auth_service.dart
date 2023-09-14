import 'package:notify/data/models/auth/login/login.dart';
import 'package:notify/data/models/auth/register/register.dart';

abstract interface class IAuthService {
  Future<LoginResponse?> login(LoginRequest request);

  Future<RegisterResponse?> register(RegisterRequest request);
}
