import 'package:dio/dio.dart';
import 'package:fhome/components/api_constants.dart';
import 'package:fhome/repositories/models/product_model.dart';

import 'dart:convert';

class ProductApi {
  final Dio _dio = Dio();
  
  Future<Product> fetchProduct(int id) async {
    final response =
        await _dio.get('$baseUrl/product/$id');
    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.toString());
      return Product.fromJson(jsonBody);
    } else {
      throw Exception('Не удалось загрузить продукт');
    }
  }
}
