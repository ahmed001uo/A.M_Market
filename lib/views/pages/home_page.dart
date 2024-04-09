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
                Padding(
                  padding: const EdgeInsets.only(top: 110, left: 10),
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
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 125,
              width: 125,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {},
                  child: const Text(
                    "       ALL \n Categories",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "Hot Products",
                    style: TextStyle(fontSize: 24, color: Colors.deepOrange),
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
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white)),
                          ],
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(13),
                        child: Stack(
                          children: [
                            Image.network(
                              AppAssets.accessoriesScrean,
                              height: size.height * 0.13,
                              width: size.width * 0.4,
                            ),
                            const Text("accessories",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black)),
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
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white)),
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
                            const Text("helthy",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Column(
              children: [
                Text(
                  "the best",
                  style: TextStyle(fontSize: 24, color: Colors.deepOrange),
                ),
              ],
            )
          ],
        ),
      ],
    ));
  }
}
