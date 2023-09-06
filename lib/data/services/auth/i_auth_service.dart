import 'package:notify/data/models/auth/login/login.dart';

abstract interface class IAuthService {
  Future<LoginResponse?> login(LoginRequest request);

  Future<LoginResponse?> register(LoginRequest request);
}
