import 'package:notify/data/models/auth/login/login_request.dart';
import 'package:notify/data/models/auth/login/login_response.dart';
import 'package:notify/data/services/auth/auth.dart';

final class AuthService implements IAuthService {
  @override
  Future<LoginResponse?> login(LoginRequest request) {
    throw UnimplementedError();
  }

  @override
  Future<LoginResponse?> register(LoginRequest request) {
    throw UnimplementedError();
  }
}
