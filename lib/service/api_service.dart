import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fhome/repositories/models/failure_model.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Response?> getProductData() async {
    try {
      final Response response =
          await _dio.get('https://fhome.onrender.com/api/product');
      return response;
    } on SocketException {
      throw const Failure(message: 'No Internet Connection');
    } catch (err) {
      // ignore: avoid_print
      print("Error :$err");
    }
    return null;
  }
}
