import 'package:ar_market/models/add_to_cart.dart';
import 'package:ar_market/models/delivery_method.dart';
import 'package:ar_market/models/product.dart';
import 'package:ar_market/models/shipping_address.dart';
import 'package:ar_market/models/user_data.dart';
import 'package:ar_market/utilities/api.dart';
import 'package:ar_market/utilities/firestore.dart';

abstract class Database {
  Stream<List<Product>> salesProductsStream();
  Stream<List<Product>> newProductsStream();
  Stream<List<AddToCartModel>> myProductsCart();
  Stream<List<DeliveryMethod>> deliveryMethodsStream();
  Stream<List<ShippingAddress>> getShippingAddresses();
  Future<void> setUserData(UserData userData);
  Future<void> addToCart(AddToCartModel product);
   Future<void> saveAddress(ShippingAddress address);
}

String get documentId => DateTime.now().toIso8601String();

class FirestoreDatabase implements Database {
  final _service = FirestoreServices.instance;
  final String uid;
  FirestoreDatabase(
    this.uid,
  );

  @override
  Stream<List<Product>> salesProductsStream() => _service.collectionsStream(
        path: ApiPath.products(),
        builder: (data, documentId) => Product.fromMap(data!, documentId),
        queryBuilder: (query) => query.where("discountValue", isNotEqualTo: 0),
      );
  @override
  Stream<List<Product>> newProductsStream() => _service.collectionsStream(
        path: ApiPath.products(),
        builder: (data, documentId) => Product.fromMap(data!, documentId),
      );
  @override
  Future<void> setUserData(UserData userData) async => await _service.setData(
        path: ApiPath.user(userData.uid),
        data: userData.toMap(),
      );
  @override
  Future<void> addToCart(AddToCartModel product) async => _service.setData(
        path: ApiPath.addToCart(uid, product.id),
        data: product.toMap(),
      );
  @override
  Stream<List<AddToCartModel>> myProductsCart() => _service.collectionsStream(
        path: ApiPath.myProductsCart(uid),
        builder: (data, documentId) =>
            AddToCartModel.fromMap(data!, documentId),
      );
  @override
  Stream<List<DeliveryMethod>> deliveryMethodsStream() =>
      _service.collectionsStream(
          path: ApiPath.deliveryMethods(),
          builder: (data, documentId) =>
              DeliveryMethod.fromMap(data!, documentId));

  @override
  Stream<List<ShippingAddress>> getShippingAddresses() =>
      _service.collectionsStream(
        path: ApiPath.userShippingAddress(uid),
        builder: (data, documentId) =>
            ShippingAddress.fromMap(data!, documentId),
      );

  @override
  Future<void> saveAddress(ShippingAddress address) => _service.setData(
        path: ApiPath.newAddress(
          uid,
          address.id,
        ),
        data: address.toMap(),
      );
}
