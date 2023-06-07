import 'package:bloc/bloc.dart';
import 'package:fhome/repositories/models/product_model.dart';

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
