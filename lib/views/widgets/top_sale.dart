import 'package:ar_market/models/product.dart';
import 'package:flutter/material.dart';

class TopSale extends StatefulWidget {
  const TopSale({super.key});

  @override
  State<TopSale> createState() => _TopSaleState();
}

class _TopSaleState extends State<TopSale> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Column(
              children: [
                const Text(
                  "Top Sale",
                  style: TextStyle(fontSize: 24, color: Colors.green),
                ),
                SizedBox(
                  height: 600,
                  width: double.infinity,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: dummyProducts
                        .map((e) => TopSSale(
                              product: e,
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TopSSale extends StatelessWidget {
  final Product product;
  const TopSSale({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
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
    );
  }
}
