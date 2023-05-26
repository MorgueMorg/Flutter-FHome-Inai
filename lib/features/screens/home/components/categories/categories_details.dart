// import 'package:fhome/repositories/models/product_model.dart';
// import 'package:fhome/service/category_detail_service.dart';
// import 'package:flutter/material.dart';

// class CategoriesDetails extends StatefulWidget {
//   static String routeName = '/categories_details';
//   final int categoryId;

//   CategoriesDetails({required this.categoryId});

//   @override
//   _CategoriesDetailsState createState() => _CategoriesDetailsState();
// }

// class _CategoriesDetailsState extends State<CategoriesDetails> {
//   final CategoryDetailService categoryDetailService = CategoryDetailService();
//   List<Product> products = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchProducts();
//   }

//   void fetchProducts() async {
//     try {
//       List<Product> fetchedProducts = await categoryDetailService
//           .fetchProductsByCategory(widget.categoryId);
//       setState(() {
//         products = fetchedProducts;
//       });
//     } catch (e) {
//       // Обработка ошибки
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Список продуктов'),
//       ),
//       body: ListView.builder(
//         itemCount: products.length,
//         itemBuilder: (BuildContext context, int index) {
//           return ListTile(
//             title: Text(products[index].title),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class CategoriesDetails extends StatelessWidget {
  static String routeName = '/categories_details';
  const CategoriesDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
