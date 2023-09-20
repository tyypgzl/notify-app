// ignore_for_file: constant_identifier_names

import 'package:alice/alice.dart';
import 'package:cookie_client/cookie_client.dart';
import 'package:cookie_client/src/models/extension.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

enum HttpMethod { GET, POST, DELETE, PUT, PATCH }

class CookieClient {
  CookieClient({
    required String baseUrl,
    Map<String, dynamic>? headers,
    String contentType = Headers.jsonContentType,
    Duration connectTimeout = const Duration(seconds: 5),
    Duration receiveTimeout = const Duration(seconds: 5),
    Duration sendTimeout = const Duration(seconds: 5),
    ResponseType? responseType = ResponseType.json,
    Map<String, dynamic>? queryParameters,
    CookieLogger logger = const CookieLogger(
      request: false,
      responseBody: false,
    ),
    CookieInspector inspector = const CookieInspector(),
  }) {
    final options = BaseOptions(
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      sendTimeout: sendTimeout,
      contentType: contentType,
      baseUrl: baseUrl,
      headers: headers,
      responseType: responseType,
      queryParameters: queryParameters,
      validateStatus: (status) {
        if (status != null) {
          return status < 500;
        } else {
          return false;
        }
      },
    );
    _dio = Dio(options);

    final prettyDioLogger = PrettyDioLogger(
      request: logger.request,
      requestHeader: logger.requestHeader,
      requestBody: logger.requestBody,
      responseBody: logger.responseBody,
      responseHeader: logger.responseHeader,
    );

    final alice = Alice(
      navigatorKey: inspector.navigatorKey,
      darkTheme: inspector.themeMode == ThemeMode.dark,
      showNotification: inspector.showNotification,
      showInspectorOnShake: inspector.showInspectorOnShake,
    );
    _dio.interceptors.add(alice.getDioInterceptor());

    if (logger.showLogger) {
      _dio.interceptors.add(prettyDioLogger);
    }
  }

  void setToken(String? token) {
    if (token != null) {
      _dio.options.headers['Authorization'] = 'Bearer $token';
    } else {
      _dio.options.headers['Authorization'] = null;
    }
  }

  ///[Dio] Object for Network Request.
  ///The initialization is done in the constructor method.
  late final Dio _dio;

  ///Handy method to make [HttpMethod.POST] request.
  ///[data] must be of type [Map].
  Future<K> post<R extends CookieNetworkModel<Object>, K>(
    String path, {
    required R responseModel,
    Map<String, dynamic>? queryParameters,
    dynamic data,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    ProgressCallback? onSendProgress,
    ResponseType responseType = ResponseType.json,
    Map<String, dynamic>? headers,
    String contentType = Headers.jsonContentType,
  }) async {
    try {
      final dioResponse = await _dio.post<Map<String, dynamic>>(
        path,
        queryParameters: queryParameters,
        data: data,
        options: Options(
          responseType: responseType,
          headers: headers,
          contentType: contentType,
          method: HttpMethod.POST.name,
        ),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      );

      final result = _convertToGenericType<R, K>(dioResponse, responseModel);
      return result;
    } on DioException catch (e, stackTrace) {
      Error.throwWithStackTrace(e.toCookieException(), stackTrace);
    }
  }

  ///Handy method to make [HttpMethod.GET] request.
  ///data must be of type [Map].
  Future<String?> getString(
    String path, {
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    ProgressCallback? onSendProgress,
    ResponseType responseType = ResponseType.json,
    String contentType = Headers.jsonContentType,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final dioResponse = await _dio.get<String>(
        path,
        queryParameters: queryParameters,
        options: Options(
          responseType: responseType,
          headers: headers,
          contentType: contentType,
          method: HttpMethod.GET.name,
        ),
        onReceiveProgress: onReceiveProgress,
        cancelToken: cancelToken,
      );

      return dioResponse.data;
    } on DioException catch (e, stackTrace) {
      Error.throwWithStackTrace(e.toCookieException(), stackTrace);
    }
  }

  ///Handy method to make [HttpMethod.GET] request.
  ///data must be of type [Map].
  Future<K> get<R extends CookieNetworkModel<Object>, K>(
    String path, {
    required R responseModel,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    ProgressCallback? onSendProgress,
    ResponseType responseType = ResponseType.json,
    String contentType = Headers.jsonContentType,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final dioResponse = await _dio.get<Map<String, dynamic>>(
        path,
        queryParameters: queryParameters,
        options: Options(
          responseType: responseType,
          headers: headers,
          contentType: contentType,
          method: HttpMethod.GET.name,
        ),
        onReceiveProgress: onReceiveProgress,
        cancelToken: cancelToken,
      );

      final result = _convertToGenericType<R, K>(dioResponse, responseModel);
      return result;
    } on DioException catch (e, stackTrace) {
      Error.throwWithStackTrace(e.toCookieException(), stackTrace);
    }
  }

  ///Handy method to make [HttpMethod.DELETE] request.
  ///[data] must be of type [Map].
  Future<K> delete<R extends CookieNetworkModel<Object>, K>(
    String path, {
    required R responseModel,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String contentType = Headers.jsonContentType,
    ResponseType responseType = ResponseType.json,
    CancelToken? cancelToken,
  }) async {
    try {
      final dioResponse = await _dio.delete<Map<String, dynamic>>(
        path,
        queryParameters: queryParameters,
        data: data,
        cancelToken: cancelToken,
        options: Options(
          responseType: responseType,
          headers: headers,
          contentType: contentType,
          method: HttpMethod.DELETE.name,
        ),
      );

      final result = _convertToGenericType<R, K>(dioResponse, responseModel);
      return result;
    } on DioException catch (e, stackTrace) {
      Error.throwWithStackTrace(e.toCookieException(), stackTrace);
    }
  }

  ///Handy method to make [HttpMethod.PUT] request.
  ///[data] must be of type [Map].
  Future<K> put<R extends CookieNetworkModel<Object>, K>(
    String path, {
    required R responseModel,
    Map<String, dynamic>? queryParameters,
    dynamic data,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    ProgressCallback? onSendProgress,
    ResponseType responseType = ResponseType.json,
    Map<String, dynamic>? headers,
    String contentType = Headers.jsonContentType,
  }) async {
    try {
      final dioResponse = await _dio.put<Map<String, dynamic>>(
        path,
        queryParameters: queryParameters,
        data: data,
        cancelToken: cancelToken,
        onReceiveProgress: onSendProgress,
        onSendProgress: onSendProgress,
        options: Options(
          responseType: responseType,
          headers: headers,
          contentType: contentType,
          method: HttpMethod.PUT.name,
        ),
      );

      final result = _convertToGenericType<R, K>(dioResponse, responseModel);
      return result;
    } on DioException catch (e, stackTrace) {
      Error.throwWithStackTrace(e.toCookieException(), stackTrace);
    }
  }

  ///Handy method to make [HttpMethod.PATCH] request.
  ///[data] must be of type [Map].
  Future<K> patch<R extends CookieNetworkModel<Object>, K>(
    String path, {
    required R responseModel,
    Map<String, dynamic>? queryParameters,
    dynamic data,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    ProgressCallback? onSendProgress,
    ResponseType responseType = ResponseType.json,
    Map<String, dynamic>? headers,
    String contentType = Headers.jsonContentType,
  }) async {
    try {
      final dioResponse = await _dio.patch<Map<String, dynamic>>(
        path,
        queryParameters: queryParameters,
        data: data,
        cancelToken: cancelToken,
        onReceiveProgress: onSendProgress,
        onSendProgress: onSendProgress,
        options: Options(
          responseType: responseType,
          headers: headers,
          contentType: contentType,
          method: HttpMethod.PATCH.name,
        ),
      );

      final result = _convertToGenericType<R, K>(dioResponse, responseModel);
      return result;
    } on DioException catch (e, stackTrace) {
      Error.throwWithStackTrace(e.toCookieException(), stackTrace);
    }
  }

  Future<Response<dynamic>> download({
    required String urlPath,
    required String filePath,
    dynamic data,
    bool deleteOnError = true,
    ProgressCallback? onReceiveProgress,
    CancelToken? cancelToken,
    ResponseType responseType = ResponseType.bytes,
  }) async {
    try {
      final result = await _dio.download(
        urlPath,
        filePath,
        onReceiveProgress: onReceiveProgress,
        data: data,
        deleteOnError: deleteOnError,
        cancelToken: cancelToken,
        options: Options(
          responseType: responseType,
        ),
      );
      return result;
    } on DioException catch (e, stackTrace) {
      Error.throwWithStackTrace(e.toCookieException(), stackTrace);
    }
  }

  K _convertToGenericType<R extends CookieNetworkModel<Object>, K>(
    Response<dynamic> dioResponse,
    R responseModel,
  ) {
    try {
      final data = dioResponse.data;
      if (data is List) {
        final typedListModel = List<R>.from(
          data
              .map(
                (e) => responseModel.fromJson(e as Map<String, dynamic>) as R,
              )
              .toList(),
        ) as K;
        return typedListModel;
      } else {
        final typedModel =
            responseModel.fromJson(data as Map<String, dynamic>) as K;
        return typedModel;
      }
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        JsonParseException(error: error.toString()),
        stackTrace,
      );
    }
  }
}
