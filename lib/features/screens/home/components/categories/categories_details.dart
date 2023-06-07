import 'package:fhome/components/size_config.dart';
import 'package:fhome/features/screens/home/components/categories/components/category_details_body.dart';
import 'package:fhome/service/category_detail_service.dart';
import 'package:flutter/material.dart';
import 'package:fhome/repositories/models/product_model.dart';

class CategoryDetails extends StatefulWidget {
  static String routeName = '/categories_details';
  final int categoryId;

  const CategoryDetails({Key? key, required this.categoryId}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
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
        title: const Text("Выберите продукт"),
      ),
      body: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(15)),
          CategoryDetailsBody(productListFuture: _productListFuture),
        ],
      ),
    );
  }
}
