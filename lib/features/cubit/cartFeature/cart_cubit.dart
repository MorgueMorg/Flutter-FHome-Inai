import 'package:fhome/repositories/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<List<Product>> {
  CartCubit() : super([]);

  void addProduct(Product product) {
    emit([...state, product]);
  }

  void removeProduct(Product product) {
    emit([...state]..remove(product));
  }

  void clearCart() {
    emit([]);
  }
}
