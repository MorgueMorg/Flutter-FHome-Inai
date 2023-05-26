import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fhome/features/cubit/productDetails/product_details_cubit.dart';

class ProductDetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final int productId;

  const ProductDetailsAppBar({Key? key, required this.productId})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        builder: (context, state) {
          if (state is ProductDetailsLoaded) {
            final product = state.product;
            return Text(product.title);
          } else {
            return const Text('...');
          }
        },
      ),
    );
  }
}
