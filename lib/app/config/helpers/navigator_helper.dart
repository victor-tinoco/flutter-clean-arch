import 'package:flutter/material.dart';
import 'package:squadmobile_base_project/app/config/router/routes.dart';

abstract class NavigatorHelper {
  GlobalKey<NavigatorState> get navigatorKey;
  void logout();
}

class NavigatorHelperImpl implements NavigatorHelper {
  static final _navigatorKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  void logout() {
    _navigatorKey.currentState.pushNamedAndRemoveUntil(
      Routes.home,
      (route) => false,
    );
  }
}
