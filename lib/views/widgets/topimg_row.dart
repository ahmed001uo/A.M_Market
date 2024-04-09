import 'package:ar_market/models/product.dart';
import 'package:flutter/material.dart';

class TopTitel extends StatelessWidget {
  final Product product;
  const TopTitel({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(),
      child: Row(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: Image.network(
                  product.imgUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const Text(
                "Top Sale",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ],
      ),
    );
  }
}






