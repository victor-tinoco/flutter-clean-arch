import 'package:flutter/material.dart';
import 'package:squadmobile_base_project/app/config/router/routes.dart';
import 'package:squadmobile_base_project/app/presentation/pages/home/home_page.dart';
import 'package:squadmobile_base_project/app/presentation/pages/user_details/user_details_page.dart';

class CustomRouter {
  static final routes = {
    Routes.home: (_) => HomePage(),
    Routes.userDetails: (_) => UserDetailsPage(),
  };

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: Text('Nenhuma rota definida para ${settings.name}.'),
        ),
      ),
    );
  }
}
