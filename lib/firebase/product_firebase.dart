import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:practice/model/product.dart';

class ProductFirestoreService {
  final CollectionReference _productsCollection =
  FirebaseFirestore.instance.collection('products');

  Stream<List<Product>> getProducts() {
    return _productsCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return Product(
          id: doc.id,
          name: data['name'],
          price: data['price'],
        );
      }).toList();
    });
  }

  Future<void> addProduct(Product product) {
    return _productsCollection.add({
      'name': product.name,
      'price': product.price,
    });
  }

  Future<void> updateProduct(Product product) {
    return _productsCollection.doc(product.id).update({
      'name': product.name,
      'price': product.price,
    });
  }

  Future<void> deleteProduct(String productId) {
    return _productsCollection.doc(productId).delete();
  }
}