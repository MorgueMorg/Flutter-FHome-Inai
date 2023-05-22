import 'package:fhome/features/screens/details/components/body.dart';
import 'package:fhome/features/screens/details/components/details_app_bar.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProductDetailsAppBar(productId: widget.productId),
      body: ProductDetailsBody(productId: widget.productId),
    );
  }
}
