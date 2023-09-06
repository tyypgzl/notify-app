abstract interface class IAuthRepository {
  Future<void> login();
  Future<void> saveOnboardStatusToDone();
  Future<String?> readOnboardStatus();
}
