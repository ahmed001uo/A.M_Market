import 'package:ar_market/controller/database_controller.dart';
import 'package:ar_market/utilities/args_models/add_shipping_address_args.dart';
import 'package:ar_market/utilities/routes.dart';
import 'package:ar_market/views/pages/chickout_page/add_shipping_address_page.dart';
import 'package:ar_market/views/pages/chickout_page/shipping_addresses_page.dart';
import 'package:ar_market/views/pages/home_page.dart';
import 'package:ar_market/views/pages/login_page.dart';
import 'package:ar_market/views/pages/navbar_page.dart';
import 'package:ar_market/views/pages/product_details.dart';
import 'package:ar_market/views/pages/chickout_page/checkout_page.dart';
import 'package:ar_market/views/widgets/top_sale.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.productDetailsRoute:
      final args = settings.arguments as Map<String, dynamic>;
      final product = args['product'];
      final database = args['database'];
      return CupertinoPageRoute(
        builder: (_) => Provider<Database>.value(
          value: database,
          child: ProductDetails(product: product),
        ),
        settings: settings,
      );

    case AppRoutes.checkoutPageRoute:
      final database = settings.arguments as Database;
      return CupertinoPageRoute(
        builder: (_) => Provider<Database>.value(
            value: database, child: const CheckoutPage()),
        settings: settings,
      );

    case AppRoutes.shippingAddressesRoute:
      final database = settings.arguments as Database;
      return CupertinoPageRoute(
        builder: (_) => Provider<Database>.value(
          value: database,
          child: const ShippingAddressesPage(),
        ),
        settings: settings,
      );
    // case AppRoutes.paymentMethodsRoute:
    //   return CupertinoPageRoute(
    //     builder: (_) => const PaymentMethodsPage(),
    //     settings: settings,
    //   );
    case AppRoutes.addShippingAddressRoute:
      final args = settings.arguments as AddShippingAddressArgs;
      final database = args.database;
      final shippingAddress = args.shippingAddress;

      return CupertinoPageRoute(
        builder: (_) => Provider<Database>.value(
          value: database,
          child: AddShippingAddressPage(
            shippingAddress: shippingAddress,
          ),
        ),
        settings: settings,
      );

    case AppRoutes.topSaleRoute:
      return CupertinoPageRoute(
          builder: (_) => const TopSale(), settings: settings);

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
