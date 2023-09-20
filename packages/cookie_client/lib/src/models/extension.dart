import 'package:cookie_client/cookie_client.dart';

extension DioExceptionX on DioException {
  CookieException toCookieException() {
    switch (type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return TimeOutException(
          error: error.toString(),
          stackTrace: stackTrace,
        );
      case DioExceptionType.badResponse:
      case DioExceptionType.badCertificate:
      case DioExceptionType.cancel:
      case DioExceptionType.unknown:
        return UnknownException(
          error: error.toString(),
          stackTrace: stackTrace,
        );
      case DioExceptionType.connectionError:
        return ConnectionException(
          error: error.toString(),
          stackTrace: stackTrace,
        );
    }
  }
}
