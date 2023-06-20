import 'package:dio/dio.dart';

class EmailService {
  static const String baseUrl = 'https://fhome.onrender.com';

  static Dio _dio = Dio(BaseOptions(
    baseUrl: baseUrl,
  ));

  static Future<Response> verifyCode(String userId, String code) async {
    try {
      final response = await _dio.post('/api/user/verify/$userId/$code');
      return response;
    } catch (error) {
      throw error;
    }
  }
}
