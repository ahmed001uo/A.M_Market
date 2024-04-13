
import 'package:ar_market/models/product.dart';
import 'package:ar_market/models/user_data.dart';
import 'package:ar_market/utilities/api.dart';
import 'package:ar_market/utilities/firestore.dart';

abstract class Database {
  Stream<List<Product>> salesProductsStream();
  Stream<List<Product>> newProductsStream();
   Future<void> setUserData(UserData userData);
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
      queryBuilder: (query) => query.where("discountValue", isNotEqualTo: 0));

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
}
