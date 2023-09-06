enum ExceptionType {
  general,
  storage;
}

final class NotifyException implements Exception {
  NotifyException({
    required this.type,
    this.message,
    this.statusCode = -1,
  });

  final ExceptionType type;
  final String? message;
  final int statusCode;
}
