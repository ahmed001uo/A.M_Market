import 'package:ar_market/utilities/assets_page.dart';
import 'package:flutter/material.dart';

class HotProductsPuttons extends StatelessWidget {
  const HotProductsPuttons({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          "Hot Products",
          style: TextStyle(fontSize: 22, color: Colors.black),
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
                      style: TextStyle(fontSize: 18, color: Colors.white)),
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
                      style: TextStyle(fontSize: 18, color: Colors.white)),
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
                      style: TextStyle(fontSize: 18, color: Colors.white)),
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
    );
  }
}
