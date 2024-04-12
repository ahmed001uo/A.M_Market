import 'package:ar_market/models/product.dart';
import 'package:ar_market/utilities/routes.dart';
import 'package:ar_market/views/pages/home_page.dart';
import 'package:ar_market/views/pages/login_page.dart';
import 'package:ar_market/views/pages/navbar_page.dart';
import 'package:ar_market/views/pages/product_details.dart';
import 'package:ar_market/views/widgets/top_sale.dart';
import 'package:flutter/cupertino.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {

     case AppRoutes.productDetailsRoute:
      final product = settings.arguments as Product;
      return CupertinoPageRoute(
        builder: (_) => ProductDetails(product: product,),
        settings: settings,
      );

    case AppRoutes.topSaleRoute:
  
      return CupertinoPageRoute(
          builder: (_) =>  const TopSale(), settings: settings);

     case AppRoutes.homePageRoute:
      return CupertinoPageRoute(
          builder: (_) => const HomePage(), settings: settings);

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
