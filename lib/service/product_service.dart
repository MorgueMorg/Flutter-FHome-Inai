import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fhome/components/api_constants.dart';
import 'package:fhome/repositories/models/failure_model.dart';

class ProductService {
  final Dio _dio = Dio();

  Future<Response?> getProductData() async {
    try {
      final Response response = await _dio.get('$baseUrl/product');
      return response;
    } on SocketException {
      throw const Failure(message: 'Нет интернета');
    } catch (err) {
      // ignore: avoid_print
      print("Error :$err");
    }
    return null;
  }
}
