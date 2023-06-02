import 'package:dio/dio.dart';
import 'package:fhome/repositories/models/product_model.dart';

class ProductService {
  final Dio _dio = Dio();

  Future<List<Product>> getProductsByCategory(int categoryId) async {
    try {
      final response = await _dio.get(
        'https://fhome.onrender.com/api/product',
        queryParameters: {
          'pageNo': 0,
          'category': categoryId,
        },
      );

      final data = response.data;
      final List<dynamic> productList = data['products'];

      return productList
          .map((json) => Product.fromJson(json))
          .toList()
          .cast<Product>(); // Добавлен вызов метода `cast<Product>()`
    } catch (error) {
      throw Exception('Failed to fetch products: $error');
    }
  }
}
