sealed class CookieException implements Exception {
  CookieException({
    required this.message,
    this.error,
    this.stackTrace,
    this.statusCode = -1,
  });

  final String message;
  final Object? error;
  final StackTrace? stackTrace;
  final int statusCode;
}

final class JsonParseException extends CookieException {
  JsonParseException({
    required super.message,
    required super.error,
    required super.stackTrace,
    super.statusCode,
  });
}

final class BadResponseException extends CookieException {
  BadResponseException({
    required super.message,
    super.error,
    super.stackTrace,
    super.statusCode,
  });
}

final class ConnectionException extends CookieException {
  ConnectionException({
    required super.message,
    super.error,
    super.stackTrace,
    super.statusCode,
  });
}

final class TimeoutException extends CookieException {
  TimeoutException({
    required super.message,
    super.error,
    super.stackTrace,
    super.statusCode = -1,
  });
}

final class OtherException extends CookieException {
  OtherException({
    required super.message,
    super.error,
    super.stackTrace,
    super.statusCode,
  });
}
