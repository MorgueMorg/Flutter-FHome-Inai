import 'package:fhome/repositories/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesCubit extends Cubit<List<Product>> {
  FavoritesCubit() : super([]);

  void addFavorite(Product product) {
    final currentList = state.toList();
    currentList.add(product);
    emit(currentList);
  }

  void removeFavorite(Product product) {
    final currentList = state.toList();
    currentList.remove(product);
    emit(currentList);
  }
}
