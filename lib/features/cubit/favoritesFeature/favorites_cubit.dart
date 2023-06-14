import 'package:fhome/repositories/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesCubit extends Cubit<List<Product>> {
  FavoritesCubit() : super([]);

  void addProduct(Product product) {
    emit([...state, product]);
  }

  void removeProduct(Product product) {
    emit([...state]..remove(product));
  }

  bool isProductFavorite(Product product) {
    return state.contains(product);
  }
}
