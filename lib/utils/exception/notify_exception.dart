import 'package:cookie_client/cookie_client.dart';

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

  factory NotifyException.fromCookie(
    CookieException exception,
  ) {
    return switch (exception) {
      JsonParseException() => NotifyException(
          type: ExceptionType.other,
          message: exception.message,
          statusCode: exception.statusCode,
        ),
      UnknownException() => NotifyException(
          type: ExceptionType.other,
          message: exception.message,
          statusCode: exception.statusCode,
        ),
      TimeOutException() => NotifyException(
          type: ExceptionType.timeout,
          message: exception.message,
          statusCode: exception.statusCode,
        ),
      ConnectionException() => NotifyException(
          type: ExceptionType.connection,
          message: exception.message,
          statusCode: exception.statusCode,
        ),
    };
  }

  final ExceptionType type;
  final StackTrace? stackTrace;
  final String? message;
  final int? statusCode;
}
