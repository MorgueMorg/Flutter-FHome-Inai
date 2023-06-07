import 'package:equatable/equatable.dart';
import 'package:fhome/repositories/models/failure_model.dart';
import 'package:fhome/repositories/models/product_model.dart';
import 'package:fhome/repositories/product_repository/product_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_fetch_state.dart';

class ProductFetchCubit extends Cubit<ProductFetchState> {
  final ProductRepository apiRepository;

  ProductFetchCubit({required this.apiRepository})
      : super(ProductFetchInitial());

  Future<void> fetchProductApi() async {
    // ? Стягивание продуктов с бэка
    emit(ProductFetchLoading());
    try {
      final List<Product>? productList = await apiRepository.getProductList();
      emit(ProductFetchLoaded(productList: productList ?? []));
    } on Failure catch (err) {
      emit(ProductFetchError(failure: err));
    } catch (err) {
      // ignore: avoid_print
      print("Error: $err");
    }
  }

  Future<void> searchProducts(String query) async {
    emit(ProductFetchLoading());
    try {
      // ? Поиск продуктов по запросу
      final List<Product>? productList =
          await apiRepository.searchProducts(query);
      emit(ProductFetchLoaded(productList: productList ?? []));
    } on Failure catch (err) {
      emit(ProductFetchError(failure: err));
    } catch (err) {
      // ignore: avoid_print
      print("Error: $err");
    }
  }
}
