import 'package:fhome/features/screens/details/product_details_cubit.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: Expanded(
          child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
            builder: (context, state) {
              if (state is ProductDetailsLoading) {
                return const Center(child: CircularProgressIndicator());
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
      ),
    );
  }
}



// class ProductDetailsScreen extends StatelessWidget {
//   static String routeName = '/details';
//   final int productId;

//   const ProductDetailsScreen({Key? key, required this.productId})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final productDetailsCubit = context.read<ProductDetailsCubit>();

//     // Вызываем метод fetchProductDetails при открытии экрана
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       productDetailsCubit.fetchProductDetails(productId);
//     });

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Product Details'),
//       ),
//       body: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
//         builder: (context, state) {
//           if (state is ProductDetailsLoading) {
//             return Center(child: CircularProgressIndicator());
//           } else if (state is ProductDetailsLoaded) {
//             final product = state.product;
//             return ListView(
//               children: [
//                 ListTile(
//                   trailing: Image.network(product.photo),
//                   title: Text('Product Name: ${product.title}'),
//                   subtitle: Text('Product ID: ${product.id}'),
//                 ),
//                 // Add more ListTile widgets for displaying other product details
//               ],
//             );
//           } else if (state is ProductDetailsError) {
//             return Center(child: Text('Error: ${state.error}'));
//           } else {
//             return Container(); // Handle other states if necessary
//           }
//         },
//       ),
//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: () {
//       //     productDetailsCubit.fetchProductDetails(productId);
//       //   },
//       //   child: Icon(Icons.refresh),
//       // ),
//     );
//   }
// }
