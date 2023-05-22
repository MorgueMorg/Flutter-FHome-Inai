part of 'product_fetch_cubit.dart';

abstract class ProductFetchState extends Equatable {
  const ProductFetchState();
  @override
  List<Object> get props => [];
}

class ProductFetchInitial extends ProductFetchState {}

class ProductFetchLoading extends ProductFetchState {}

class ProductFetchLoaded extends ProductFetchState {
  final List<Product> productList;

  const ProductFetchLoaded({required this.productList});

  @override
  List<Object> get props => [productList];
}

class ProductFetchError extends ProductFetchState {
  final Failure failure;

  const ProductFetchError({required this.failure});

  @override
  List<Object> get props => [failure];
}
