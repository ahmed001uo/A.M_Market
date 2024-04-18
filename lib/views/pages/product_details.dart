import 'package:ar_market/controller/database_controller.dart';
import 'package:ar_market/models/add_to_cart.dart';
import 'package:ar_market/models/product.dart';
import 'package:ar_market/utilities/constants.dart';
import 'package:ar_market/views/widgets/drop_down_menu.dart';
import 'package:ar_market/views/widgets/main_button.dart';
import 'package:ar_market/views/widgets/main_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  final Product product;
  const ProductDetails({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool isFavorite = false;
  late String dropdownValue;
  BuildContext? dialogContext;

  Future<void> _addToCart(Database database) async {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    dialogContext = context;
    try {
      final addToCartProduct = AddToCartModel(
        email: googleUser!.email,
        id: documentIdFromLocalData(),
        title: widget.product.title,
        price: widget.product.price,
        productId: widget.product.id,
        imgUrl: widget.product.imgUrl,
        size: dropdownValue,
      );
      await database.addToCart(addToCartProduct);
    } catch (e) {
      return MainDialog(
        context: dialogContext!,
        title: 'Error',
        content: 'Couldn\'t adding to the cart, please try again!',
      ).showAlertDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final database = Provider.of<Database>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        shadowColor: Colors.red,
        backgroundColor: Colors.white,
        title: Text(widget.product.title),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.share))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              widget.product.imgUrl,
              width: size.height * 1,
              height: size.height * 0.3,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 60,
                          child: DropDownMenuComponent(
                            items: const ['S', 'M', 'L', 'XL', 'XXL'],
                            hint: 'Size',
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                          ),
                        ),
                      ),
                      const Spacer(),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                          },
                          child: SizedBox(
                            height: 50,
                            width: 50,
                            child: DecoratedBox(
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined,
                                  color: isFavorite
                                      ? Colors.redAccent
                                      : Colors.black45,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.product.title,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "\$ ${widget.product.price} ",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      " ${widget.product.category} ",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.grey),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    " This is agreat work you can  buy it if you need it  :)  ",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: MainButton(
                      text: 'Add to cart',
                      onTap: () => _addToCart(database),
                      hasCircularBorder: true,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
