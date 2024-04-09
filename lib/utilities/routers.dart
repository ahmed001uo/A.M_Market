import 'package:ar_market/utilities/routes.dart';
import 'package:ar_market/views/pages/login_page.dart';
import 'package:ar_market/views/pages/navbar_page.dart';
import 'package:flutter/cupertino.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.navBarPageRoute:
      return CupertinoPageRoute(
          builder: (_) => const ButtonNavBar(), settings: settings);

    case AppRoutes.loginPageRoute:
    default:
      return CupertinoPageRoute(
        builder: (_) => const LoginPage(),
        settings: settings,
      );
  }
}
