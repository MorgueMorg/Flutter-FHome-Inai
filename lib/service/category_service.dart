import 'package:dio/dio.dart';
import 'package:fhome/components/api_constants.dart';
import 'package:fhome/repositories/models/category_model.dart';

class CategoryService {
  final Dio _dio = Dio();

  Future<List<CategoryModel>> fetchCategories() async {
    try {
      final response = await _dio.get('$baseUrl/category');
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = response.data;
        return jsonList.map((json) => CategoryModel.fromJson(json)).toList();
      } else {
        throw Exception('Не удалось загрузить категории');
      }
    } catch (e) {
      throw Exception('Не удалось загрузить категории: $e');
    }
  }
}
