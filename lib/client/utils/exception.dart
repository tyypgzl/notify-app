abstract interface class CookieException implements Exception {
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
  JsonParseException({required this.error});
  final String error;

  @override
  String get message => error;

  @override
  int? get statusCode => null;
}

final class StatusException implements CookieException {
  StatusException({
    required this.status,
    required this.error,
  });

  final String? error;
  final int? status;

  @override
  String get message => error ?? 'Http Status not successful';

  @override
  int? get statusCode => status;
}
