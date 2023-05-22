import 'package:fhome/components/constants.dart';
import 'package:fhome/features/screens/details/product_details_cubit.dart';
import 'package:fhome/repositories/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsScreen extends StatefulWidget {
  static String routeName = '/details';
  final int productId;

  const ProductDetailsScreen({Key? key, required this.productId})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late ProductDetailsCubit productDetailsCubit;
  late Product product;

  @override
  void initState() {
    super.initState();
    productDetailsCubit = context.read<ProductDetailsCubit>();
    productDetailsCubit.fetchProductDetails(widget.productId);
  }

  Future<void> _refreshData() async {
    productDetailsCubit.fetchProductDetails(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    productDetailsCubit = context.read<ProductDetailsCubit>();
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
          builder: (context, state) {
            if (state is ProductDetailsLoaded) {
              product = state.product;
              return Text(product.title);
            } else {
              return const Text('...');
            }
          },
        ),
      ),
      body: RefreshIndicator(
        color: darkPink,
        onRefresh: _refreshData,
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
                builder: (context, state) {
                  if (state is ProductDetailsLoading) {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: darkPink,
                    ));
                  } else if (state is ProductDetailsLoaded) {
                    final product = state.product;
                    return ListView(
                      children: [
                        ListTile(
                          trailing: Image.network(product.photo),
                          title: Text('Product Name: ${product.title}'),
                          subtitle: Text('Product ID: ${product.id}'),
                        ),
                        // Add more ListTile widgets for displaying other product details
                      ],
                    );
                  } else if (state is ProductDetailsError) {
                    return Center(child: Text('Error: ${state.error}'));
                  } else {
                    return Container(); // Handle other states if necessary
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
