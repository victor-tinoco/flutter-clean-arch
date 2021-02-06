import 'dart:io';

import 'package:dio/dio.dart';
import 'package:squadmobile_base_project/app/config/helpers/navigator_helper.dart';
import 'package:squadmobile_base_project/app/data/source/local/token_local_data_source.dart';
import 'package:squadmobile_base_project/app/data/source/remote/http_protocols/endpoints.dart';
import 'package:squadmobile_base_project/core/constants/http_code.dart';

class CustomInterceptor extends Interceptor {
  final TokenLocalDataSource _tokenDataSource;
  final NavigatorHelper _navigatorManager;

  CustomInterceptor(
    this._tokenDataSource,
    this._navigatorManager,
  );

  @override
  Future onRequest(RequestOptions options) async {
    final relativePath = options.path;

    if (!Endpoints.tokenBlackList.contains(relativePath)) {
      await _handleToken(options);
    }

    return super.onRequest(options);
  }

  @override
  Future onError(DioError err) async {
    if (err?.response?.statusCode == HttpCode.UNAUTHORIZED) {
      _navigatorManager.logout();
    }

    return err;
  }

  Future<void> _handleToken(
    RequestOptions options,
  ) async {
    final token = await _tokenDataSource.get();
    const tokenTypeKey = 'Bearer';

    if (token.accessTokenIsValid) {
      options.headers[HttpHeaders.authorizationHeader] =
          '$tokenTypeKey ${token.accessToken}';
    } else {
      _navigatorManager.logout();
    }
  }
}
