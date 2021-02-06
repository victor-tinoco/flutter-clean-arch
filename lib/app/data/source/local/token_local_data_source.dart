import 'dart:convert';

import 'package:squadmobile_base_project/app/config/helpers/cache_helper.dart';

abstract class TokenDto {
  String accessToken;
  Duration accessTokenExpiresIn;
  String refreshToken;
  Duration refreshTokenExpiresIn;

  bool get refreshTokenIsValid;
  bool get accessTokenIsValid;
}

abstract class TokenLocalDataSource {
  Future<TokenDto> get();
  Future<void> set(TokenDto token);
  Future<void> clear();
}

class TokenLocalDataSourceImpl implements TokenLocalDataSource {
  static const _TOKEN_KEY = 'token';
  final CacheHelper _cacheHelper;

  TokenLocalDataSourceImpl(this._cacheHelper);

  Future<TokenDto> get() async {
    final value = await _cacheHelper.get(_TOKEN_KEY);

    // if (value != null) return TokenResponse.fromJson(jsonDecode(value));

    return null;
  }

  @override
  Future<void> set(TokenDto token) {
    return _cacheHelper.set(_TOKEN_KEY, jsonEncode(token));
  }

  @override
  Future<void> clear() => _cacheHelper.remove(_TOKEN_KEY);
}
