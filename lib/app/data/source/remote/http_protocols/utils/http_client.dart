import 'package:dio/dio.dart';
import 'package:squadmobile_base_project/app/data/source/remote/http_protocols/utils/content_type.dart';

abstract class HttpClient {
  Future<Response> get(
    String url, {
    Map<String, dynamic> queryParams,
  });

  Future<Response> post(
    String url, {
    dynamic body,
    CustomContentType contentType,
    Map<String, dynamic> queryParams,
  });

  Future<Response> put(
    String url, {
    dynamic body,
    CustomContentType contentType,
    Map<String, dynamic> queryParams,
  });

  Future<Response> delete(
    String url, {
    dynamic body,
    Map<String, dynamic> queryParams,
  });
}
