import 'package:fhome/components/constants.dart';
import 'package:fhome/components/size_config.dart';
import 'package:fhome/features/screens/product_details/product_details_screen.dart';
import 'package:fhome/repositories/models/product_model.dart';
import 'package:flutter/material.dart';

class CategoryDetailsBody extends StatelessWidget {
  const CategoryDetailsBody({
    super.key,
    required Future<List<Product>> productListFuture,
  }) : _productListFuture = productListFuture;

  final Future<List<Product>> _productListFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: _productListFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: lightPink,
            ),
          );
        }

        if (snapshot.hasError) {
          return const Center(
            child: Text('Failed to load products'),
          );
        }

        final List<Product> productList = snapshot.data ?? [];

        return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: productList.length,
          itemBuilder: (context, index) {
            final product = productList[index];
            return ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  product.photo,
                  height: getProportionateScreenHeight(50),
                  width: getProportionateScreenWidth(50),
                ),
              ),
              trailing: Text(
                "${product.price} som",
                style: const TextStyle(
                    color: darkPink, fontWeight: FontWeight.w700, fontSize: 16),
              ),
              title: Text(product.title),
              subtitle: Text('${product.description.substring(0, 28)}...'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProductDetailsScreen(productId: product.id),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
