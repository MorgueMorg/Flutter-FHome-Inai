import 'package:fhome/service/category_detail_service.dart';
import 'package:flutter/material.dart';
import 'package:fhome/repositories/models/product_model.dart';

class CategoryDetails extends StatefulWidget {
  static String routeName = '/categories_details';
  final int categoryId;

  const CategoryDetails({Key? key, required this.categoryId})
      : super(key: key);

  @override
  _CategoryDetailsState createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  final ProductService _productService = ProductService();
  late Future<List<Product>> _productListFuture;

  @override
  void initState() {
    super.initState();
    _productListFuture =
        _productService.getProductsByCategory(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category Details'),
      ),
      body: FutureBuilder<List<Product>>(
        future: _productListFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Failed to fetch products'),
            );
          }

          final List<Product> productList = snapshot.data ?? [];

          return ListView.builder(
            itemCount: productList.length,
            itemBuilder: (context, index) {
              final product = productList[index];
              return ListTile(
                leading: Image.network(product.photo),
                title: Text(product.title),
                subtitle: Text(product.description),
                trailing: Text('\$${product.price}'),
              );
            },
          );
        },
      ),
    );
  }
}
