import 'package:fhome/repositories/models/product_model.dart';

class CartModel {
  final List<Product> _products = [];

  List<Product> get products => _products;

  void addProduct(Product product) {
    _products.add(product);
  }

  void removeProduct(Product product) {
    _products.remove(product);
  }

  void clearCart() {
    _products.clear();
  }
}
