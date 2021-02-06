import 'dart:io';

import 'package:dio/dio.dart';
import 'package:squadmobile_base_project/app/data/source/remote/http_protocols/utils/content_type.dart';
import 'package:squadmobile_base_project/app/data/source/remote/http_protocols/utils/http_client.dart';

class CustomHttpClient implements HttpClient {
  Dio _client;

  CustomHttpClient(this._client, List<Interceptor> interceptors) {
    _client = _client
      ..interceptors.addAll(interceptors)
      ..options.baseUrl = 'https://pokeapi.co/api/v2/';
  }

  void _setupHeaders({
    CustomContentType contentType,
  }) {
    Map<String, dynamic> headers = _client.options.headers;
    headers[Headers.contentTypeHeader] = contentType.headerParameter;
    headers['Api-Key'] = 'Fm0HzbDOugDlnczqucLl6Ak7kOxmp6ZU';
    _client.options.headers = headers;
  }

  RequestException _handleDioError(DioError error) =>
      RequestException('Ocorreu um erro.');

  void _handleError(Map<String, dynamic> data) {
    const successOptionalReturnCodeKey = '00';
    const returnCodeKey = 'returnCode';
    const returnDescriptionKey = 'returnDescription';

    String returnCode = data[returnCodeKey];
    if (returnCode != successOptionalReturnCodeKey && returnCode != null)
      throw RequestException(data[returnDescriptionKey] ?? '');
  }

  Future<Response> get(
    String url, {
    Map<String, dynamic> queryParams,
  }) async {
    _setupHeaders();

    try {
      final response = await _client.get(url, queryParameters: queryParams);
      _handleError(response.data);
      return response;
    } on DioError catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Response> post(
    String url, {
    dynamic body,
    CustomContentType contentType = CustomContentType.APPLICATION_JSON,
    Map<String, dynamic> queryParams = const <String, dynamic>{},
  }) async {
    _setupHeaders(contentType: contentType);

    try {
      final response = await _client.post(
        url,
        data: body,
        queryParameters: queryParams,
      );
      _handleError(response.data);
      return response;
    } on DioError catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Response> put(
    String url, {
    dynamic body,
    Map<String, dynamic> queryParams,
    CustomContentType contentType = CustomContentType.APPLICATION_JSON,
  }) async {
    _setupHeaders(contentType: contentType);

    try {
      final response = await _client.put(
        url,
        data: body,
        queryParameters: queryParams,
      );
      _handleError(response.data);
      return response;
    } on DioError catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Response> delete(
    String url, {
    dynamic body,
    Map<String, dynamic> queryParams,
  }) async {
    _setupHeaders();

    try {
      final response = await _client.delete(url, queryParameters: queryParams);
      _handleError(response.data);
      return response;
    } on DioError catch (e) {
      throw _handleDioError(e);
    }
  }
}

class RequestException implements Exception {
  final String message;

  const RequestException(this.message);
}
