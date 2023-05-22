// ignore: depend_on_referenced_packages
import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fhome/repositories/models/failure_model.dart';
import 'package:fhome/repositories/models/product_model.dart';
import 'package:fhome/repositories/product_repository/product_repository.dart';

part 'product_fetch_state.dart';

class ProductFetchCubit extends Cubit<ProductFetchState> {
  final ProductRepository apiRepository;

  ProductFetchCubit({required this.apiRepository})
      : super(ProductFetchInitial());

  Future<void> fetchProductApi() async {
    emit(ProductFetchLoading());
    try {
      final List<Product>? productList = await apiRepository.getProductList();
      emit(ProductFetchLoaded(productList: productList ?? []));
    } on Failure catch (err) {
      emit(ProductFetchError(failure: err));
    } catch (err) {
      // ignore: avoid_print
      print("Error :$err");
    }
  }
}
