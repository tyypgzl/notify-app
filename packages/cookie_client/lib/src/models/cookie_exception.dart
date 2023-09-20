sealed class CookieException implements Exception {
  CookieException({
    required this.message,
    this.statusCode,
  });

  final String message;
  final int? statusCode;

  @override
  String toString() {
    return 'CookieException{message: $message, statusCode: $statusCode}';
  }
}

final class JsonParseException implements CookieException {
  JsonParseException({
    required this.error,
    this.stackTrace,
  });
  final String error;
  final StackTrace? stackTrace;

  @override
  String get message => error;

  @override
  int? get statusCode => null;
}

final class UnknownException implements CookieException {
  UnknownException({
    required this.error,
    this.status,
    this.stackTrace,
  });

  final String? error;
  final int? status;
  final StackTrace? stackTrace;

  @override
  String get message => error ?? 'Unknown Exception from Cookie';

  @override
  int? get statusCode => status;
}

final class TimeOutException implements CookieException {
  TimeOutException({
    required this.error,
    this.status,
    this.stackTrace,
  });

  final String? error;
  final int? status;
  final StackTrace? stackTrace;

  @override
  String get message => error ?? 'Timeout Exception from Cookie';

  @override
  int? get statusCode => status;
}

final class ConnectionException implements CookieException {
  ConnectionException({
    required this.error,
    this.status,
    this.stackTrace,
  });

  final String? error;
  final int? status;
  final StackTrace? stackTrace;

  @override
  String get message => error ?? 'Connection Exception from Cookie';

  @override
  int? get statusCode => status;
}
