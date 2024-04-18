import 'package:ar_market/controller/database_controller.dart';
import 'package:ar_market/models/product.dart';
import 'package:ar_market/utilities/assets_page.dart';
import 'package:ar_market/utilities/routes.dart';
import 'package:ar_market/views/widgets/hot_product_puttons.dart';
import 'package:ar_market/views/widgets/list_item.dart';
import 'package:ar_market/views/widgets/search_anchor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final database = Provider.of<Database>(context);
    

    return Scaffold(
        body: ListView(
      shrinkWrap: true,
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
            const HotProductsPuttons(),
            const Text(
              "the best",
              style: TextStyle(fontSize: 22, color: Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: SizedBox(
                height: 400,
                width: double.infinity,
                child: StreamBuilder<List<Product>>(
                  stream: database.newProductsStream(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      final products = snapshot.data;
                      if (products == null || products.isEmpty) {
                        return const Center(child: Text("No Product Found"));
                      }
                      return ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: products.length,
                          itemBuilder: (_, int index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListItem(
                                  product: products[index],
                                ),
                              ),);
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
