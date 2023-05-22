// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:fhome/features/screens/details/product_api.dart';
import 'package:fhome/repositories/models/product_model.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final ProductApi _productApi = ProductApi();

  ProductDetailsCubit() : super(ProductDetailsInitial());

  Future<void> fetchProductDetails(int id) async {
    try {
      emit(ProductDetailsLoading());
      final product = await _productApi.fetchProduct(id);
      emit(ProductDetailsLoaded(product));
    } catch (e) {
      emit(ProductDetailsError(e.toString()));
    }
  }
}

// States
abstract class ProductDetailsState {}

class ProductDetailsInitial extends ProductDetailsState {}

class ProductDetailsLoading extends ProductDetailsState {}

class ProductDetailsLoaded extends ProductDetailsState {
  final Product product;

  ProductDetailsLoaded(this.product);
}

class ProductDetailsError extends ProductDetailsState {
  final String error;

  ProductDetailsError(this.error);
}
