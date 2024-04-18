
import 'package:ar_market/controller/database_controller.dart';
import 'package:ar_market/models/product.dart';
import 'package:ar_market/utilities/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListItem extends StatelessWidget {
  final Product product;
  const ListItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);
    return InkWell(
      onTap: () => Navigator.of(context)
          .pushNamed(AppRoutes.productDetailsRoute, arguments: {'product': product,
          'database': database,}),
      child: DecoratedBox(
        decoration: const BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(13),
                  child: Image.network(
                    product.imgUrl,
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    width: 50,
                    height: 30,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            24,
                          ),
                          color: Colors.red),
                      child: Center(
                        child: Text(
                          "${product.discountValue}%",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              product.category,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.grey),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              product.title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            Text(
              "${product.price}\$",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Colors.black,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
