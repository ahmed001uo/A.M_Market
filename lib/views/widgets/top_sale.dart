import 'package:ar_market/controller/database_controller.dart';
import 'package:ar_market/models/product.dart';
import 'package:ar_market/views/widgets/list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopSale extends StatefulWidget {
  const TopSale({
    super.key,
  });

  @override
  State<TopSale> createState() => _TopSaleState();
}

class _TopSaleState extends State<TopSale> {
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        shadowColor: Colors.red,
        backgroundColor: Colors.white,
        title: const Text("Top Sale"),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.share))],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Column(
                  children: [
                    const Text(
                      "Top Sale",
                      style: TextStyle(fontSize: 24, color: Colors.black),
                    ),
                    SizedBox(
                      height: 600,
                      width: double.infinity,
                      child: StreamBuilder<List<Product>>(
                        stream: database.salesProductsStream(),
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.active) {
                            final products = snapshot.data;
                            if (products == null || products.isEmpty) {
                              return const Center(
                                  child: Text("No Product Found"));
                            }
                            return ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: products.length,
                                itemBuilder: (_, int index) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ListItem(
                                        product: products[index],
                                      ),
                                    ));
                          }
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
