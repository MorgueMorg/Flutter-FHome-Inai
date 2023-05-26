// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:fhome/components/api_constants.dart';
// import 'package:fhome/repositories/models/product_model.dart';

// class CategoryDetailService {
//   final Dio _dio = Dio();

//   Future<List<Product>> fetchProductsByCategory(int categoryId) async {
    // ! Дастанчик не сделал под это апишку
//     final response = await _dio.get('$baseUrl/product?category=$categoryId');

//     if (response.statusCode == 200) {
//       final List<dynamic> jsonList = json.decode(response.data);
//       return jsonList.map((json) => Product.fromJson(json)).toList();
//     } else {
//       throw Exception('Не удалось загрузить продукты');
//     }
//   }
// }
