import 'package:dio/dio.dart';
import 'package:fhome/components/api_constants.dart';

class EmailService {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
    ),
  );

  static Future<Response> verifyCode(String userId, String code) async {
    try {
      final response = await _dio.post('/user/verify/$userId/$code');
      return response;
    } catch (error) {
      rethrow;
    }
  }
}
