enum ExceptionType {
  other,
  network,
  connection,
  timeout,
  storage;
}

final class NotifyException implements Exception {
  NotifyException({
    required this.type,
    this.message,
    this.stackTrace,
    this.statusCode = -1,
  });

  final ExceptionType type;
  final StackTrace? stackTrace;
  final String? message;
  final int statusCode;
}
