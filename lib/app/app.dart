import 'package:flutter/material.dart';
import 'package:squadmobile_base_project/app/config/router/router.dart';
import 'package:squadmobile_base_project/app/config/router/routes.dart';
import 'package:squadmobile_base_project/app/config/themes/app_theme.dart';
import 'package:squadmobile_base_project/app/config/constants/strings.dart';

class BaseApp extends StatelessWidget {
  const BaseApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.APP_NAME,
      theme: buildTheme(),
      routes: CustomRouter.routes,
      onGenerateRoute: CustomRouter.generateRoutes,
      initialRoute: Routes.home,
    );
  }
}
