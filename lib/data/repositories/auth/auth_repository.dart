import 'package:cookie_client/cookie_client.dart';
import 'package:notify/data/models/auth/login/login.dart';
import 'package:notify/data/models/auth/register/register_request.dart';
import 'package:notify/data/models/auth/register/register_response.dart';
import 'package:notify/data/repositories/auth/auth.dart';
import 'package:notify/data/services/auth/auth.dart';
import 'package:notify/utils/constants/constants.dart';
import 'package:notify/utils/exception/notify_exception.dart';
import 'package:storage/storage.dart';

final class AuthRepository implements IAuthRepository {
  const AuthRepository({
    required IAuthService authService,
    required PersistentStorage persistentStorage,
    required SecureStorage secureStorage,
  })  : _authService = authService,
        _persistentStorage = persistentStorage,
        _secureStorage = secureStorage;

  final PersistentStorage _persistentStorage;
  final SecureStorage _secureStorage;
  final IAuthService _authService;

  @override
  Future<LoginResponse?> login(LoginRequest request) async {
    try {
      final result = await _authService.login(request);
      return result;
    } on CookieException catch (err, stackTrace) {
      Error.throwWithStackTrace(
        NotifyException(
          type: ExceptionType.other,
          statusCode: err.statusCode,
          message: err.message,
        ),
        stackTrace,
      );
    }
  }

  @override
  Future<RegisterResponse?> register(RegisterRequest request) async {
    try {
      final result = await _authService.register(request);
      return result;
    } on CookieException catch (err, stackTrace) {
      Error.throwWithStackTrace(
        NotifyException(
          type: ExceptionType.other,
          statusCode: err.statusCode,
          message: err.message,
        ),
        stackTrace,
      );
    }
  }

  @override
  Future<String?> readOnboardStatus() async {
    try {
      final result =
          await _persistentStorage.read(key: ConstStorage.onboardStatus);
      return result;
    } on StorageException catch (err, stackTrace) {
      final error = NotifyException(
        type: ExceptionType.storage,
        message: err.error.toString(),
      );
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  @override
  Future<void> saveOnboardStatusToDone() async {
    try {
      await _persistentStorage.write(
        key: ConstStorage.onboardStatus,
        value: 'done',
      );
    } on StorageException catch (err, stackTrace) {
      final error = NotifyException(
        type: ExceptionType.storage,
        message: err.error.toString(),
      );
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  @override
  Future<String?> readAccessToken() async {
    try {
      final result = await _secureStorage.read(key: ConstStorage.accessToken);
      return result;
    } on StorageException catch (err, stackTrace) {
      final error = NotifyException(
        type: ExceptionType.storage,
        message: err.error.toString(),
      );
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  @override
  Future<void> saveAccessToken(String? accessToken) async {
    try {
      await _secureStorage.write(
        key: ConstStorage.accessToken,
        value: accessToken,
      );
    } on StorageException catch (err, stackTrace) {
      final error = NotifyException(
        type: ExceptionType.storage,
        message: err.error.toString(),
      );
      Error.throwWithStackTrace(error, stackTrace);
    }
  }
}
