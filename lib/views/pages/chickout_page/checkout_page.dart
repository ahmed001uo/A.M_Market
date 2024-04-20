import 'package:ar_market/controller/database_controller.dart';
import 'package:ar_market/models/delivery_method.dart';
import 'package:ar_market/models/shipping_address.dart';
import 'package:ar_market/utilities/args_models/add_shipping_address_args.dart';
import 'package:ar_market/utilities/routes.dart';
import 'package:ar_market/views/widgets/chickout/checkout_order_details.dart';
import 'package:ar_market/views/widgets/chickout/delivery_method_item.dart';
import 'package:ar_market/views/widgets/chickout/payment_component.dart';
import 'package:ar_market/views/widgets/chickout/shipping_address_component.dart';
import 'package:ar_market/views/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final database = Provider.of<Database>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Shipping address',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8.0),
              StreamBuilder<List<ShippingAddress>>(
                  stream: database.getShippingAddresses(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      final shippingAddresses = snapshot.data;
                      if (shippingAddresses == null ||
                          shippingAddresses.isEmpty) {
                        return Center(
                          child: Column(
                            children: [
                              const Text('No Shipping Addresses!'),
                              const SizedBox(height: 6.0),
                              InkWell(
                                onTap: () => Navigator.of(context).pushNamed(
                                  AppRoutes.addShippingAddressRoute,
                                  arguments: AddShippingAddressArgs(
                                      database: database),
                                ),
                                child: Text(
                                  'Add new one',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(
                                        color: Colors.redAccent,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      final shippingAddress = shippingAddresses.first;
                      return ShippingAddressComponent(
                          shippingAddress: shippingAddress);
                    }
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }),
              const SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Payment',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  InkWell(
                    onTap: () {Navigator.of(context).pushNamed(AppRoutes.paymentMethodsRoute);},
                    child: Text(
                      'Change',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: Colors.redAccent,
                          ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              const PaymentComponent(),
              const SizedBox(height: 24.0),
              Text(
                'Delivery method',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8.0),
              StreamBuilder<List<DeliveryMethod>>(
                  stream: database.deliveryMethodsStream(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      final deliveryMethods = snapshot.data;
                      if (deliveryMethods == null || deliveryMethods.isEmpty) {
                        return const Center(
                          child: Text('No delivery methods available!'),
                        );
                      }
                      return SizedBox(
                        height: size.height * 0.14,
                        child: ListView.builder(
                          itemCount: deliveryMethods.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, i) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DeliveryMethodItem(
                                deliveryMethod: deliveryMethods[i]),
                          ),
                        ),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }),
              const SizedBox(height: 10.0),
              const CheckoutOrderDetails(),
              const SizedBox(height: 20.0),
              MainButton(
                text: 'Submit Order',
                onTap: () {},
                hasCircularBorder: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
