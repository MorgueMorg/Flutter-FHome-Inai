import 'package:dio/dio.dart';
import 'package:fhome/repositories/models/product_model.dart';

import 'dart:convert';

class ProductApi {
  final Dio _dio = Dio();
  Future<Product> fetchProduct(int id) async {
    final response =
        await _dio.get('https://fhome.onrender.com/api/product/$id');
    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.toString());
      return Product.fromJson(jsonBody);
    } else {
      throw Exception('Failed to fetch product details');
    }
  }
}