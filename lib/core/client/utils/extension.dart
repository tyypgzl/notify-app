import 'package:dio/dio.dart';
import 'package:notify/core/client/utils/exception.dart';

extension DioExceptionX on DioException {
  CookieException toException() {
    switch (type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return TimeoutException(
          stackTrace: stackTrace,
          message: 'Message: $message -- Error: $error',
          statusCode: response?.statusCode ?? -1,
        );
      case DioExceptionType.badCertificate:
        return OtherException(
          stackTrace: stackTrace,
          message: 'Message: $message -- Error: $error',
          statusCode: response?.statusCode ?? -1,
        );
      case DioExceptionType.badResponse:
        return BadResponseException(
          stackTrace: stackTrace,
          message: 'Message: $message -- Error: $error',
          statusCode: response?.statusCode ?? -1,
        );
      case DioExceptionType.cancel:
        return OtherException(
          stackTrace: stackTrace,
          message: 'Message: $message -- Error: $error',
          statusCode: response?.statusCode ?? -1,
        );
      case DioExceptionType.connectionError:
        return ConnectionException(
          stackTrace: stackTrace,
          message: 'Message: $message -- Error: $error',
          statusCode: response?.statusCode ?? -1,
        );
      case DioExceptionType.unknown:
        return OtherException(
          stackTrace: stackTrace,
          message: 'Message: $message -- Error: $error',
          statusCode: response?.statusCode ?? -1,
        );
    }
  }
}
