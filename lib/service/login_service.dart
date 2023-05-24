import 'package:dio/dio.dart';
import 'package:fhome/repositories/models/login_model.dart';

import '../components/api_constants.dart';

class LoginService {
  Dio dio = Dio();

  Future<bool> login(AuthModel authModel) async {
    try {
      final response =
          await dio.post('$baseUrl/user/login', data: authModel.toJson());
      // Проверка успешного ответа
      if (response.statusCode == 200) {
        // В случае успешной авторизации можно возвращать дополнительные данные или токен
        return true;
      } else {
        // Обработка ошибок при авторизации, например неверные учетные данные
        return false;
      }
    } catch (e) {
      // Обработка ошибок сети или других исключений
      return false;
    }
  }
}
