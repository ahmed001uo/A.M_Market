import 'package:ar_market/models/product.dart';
import 'package:ar_market/utilities/assets_page.dart';
import 'package:ar_market/utilities/routes.dart';
import 'package:ar_market/views/widgets/search_anchor.dart';
import 'package:ar_market/views/widgets/top_sale.dart';
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
        body: ListView(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  AppAssets.topHomeScrean,
                  width: size.width * 1,
                  height: size.height * 0.3,
                  fit: BoxFit.cover,
                ),
                const Padding(padding: EdgeInsets.all(6.0), child: Search()),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 90,
                    width: 125,
                    child: InkWell(
                      onTap: () => Navigator.of(context)
                          .pushNamed(AppRoutes.topSaleRoute),
                      child: Stack(
                        children: [
                          Image.network(
                            AppAssets.topSaleHomeScrean,
                          ),
                          const Text("Top Sale",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 90,
                    width: 125,
                    child: Stack(
                      children: [
                        Image.network(
                          AppAssets.topSaleHomeScrean,
                        ),
                        const Text(" ALL \n Categories",
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                const Text(
                  "Hot Products",
                  style: TextStyle(fontSize: 24, color: Colors.deepOrange),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(13),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Image.network(
                            AppAssets.clotheScrean,
                            height: size.height * 0.13,
                            width: size.width * 0.4,
                          ),
                          const Text("clothes",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white)),
                        ],
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(13),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Image.network(
                            AppAssets.accessoriesScrean,
                            height: size.height * 0.13,
                            width: size.width * 0.4,
                          ),
                          const Text("accessories",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(13),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Image.network(
                            AppAssets.elctronicScrean,
                            height: size.height * 0.13,
                            width: size.width * 0.4,
                          ),
                          const Text("elctronic",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white)),
                        ],
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(13),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Image.network(
                            AppAssets.helthyScrean,
                            height: size.height * 0.13,
                            width: size.width * 0.4,
                          ),
                          const Text(
                            "helthy",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Text(
              "the best",
              style: TextStyle(fontSize: 24, color: Colors.deepOrange),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: SizedBox(
                height: 400,
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
            ),
          ],
        ),
      ],
    ));
  }
}
