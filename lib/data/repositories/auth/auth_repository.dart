import 'package:notify/data/exception/notify_exception.dart';
import 'package:notify/data/repositories/auth/auth.dart';
import 'package:notify/data/services/auth/auth.dart';
import 'package:notify/utils/constants/constants.dart';
import 'package:notify/utils/storage/persistent_storage.dart';
import 'package:notify/utils/storage/secure_storage.dart';

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
  Future<void> login() {
    throw UnimplementedError();
  }

  @override
  Future<String?> readOnboardStatus() async {
    try {
      final result =
          await _persistentStorage.read(key: ConstStorage.onboardStatus);
      return result;
    } on PersistentStorageException catch (err, stackTrace) {
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
    } on PersistentStorageException catch (err, stackTrace) {
      final error = NotifyException(
        type: ExceptionType.storage,
        message: err.error.toString(),
      );
      Error.throwWithStackTrace(error, stackTrace);
    }
  }
}
