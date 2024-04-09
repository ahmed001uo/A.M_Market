import 'package:ar_market/models/product.dart';
import 'package:ar_market/utilities/assets_page.dart';
import 'package:ar_market/views/widgets/search_anchor.dart';
import 'package:ar_market/views/widgets/topimg_row.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            Image.network(
              AppAssets.topHomeScrean,
              width: size.width * 1,
              height: size.height * 0.3,
              fit: BoxFit.cover,
            ),
            const Padding(padding: EdgeInsets.all(8.0), child: Search()),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 90, horizontal: 90),
              child: SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: dummyProducts
                      .map((e) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TopTitel(product: e),
                          ))
                      .toList(),
                ),
              ),
            )
          ],
        ),
      ],
    ));
  }
}
