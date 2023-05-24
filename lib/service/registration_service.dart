import 'package:dio/dio.dart';
import 'package:fhome/repositories/models/registration_model.dart';

import '../components/api_constants.dart';

class RegistrationService {
  Dio dio = Dio();

  Future<bool> register(RegistrationModel registrationModel) async {
    try {
      final response = await dio.post('$baseUrl/user/registration',
          data: registrationModel.toJson());
      if (response.statusCode == 200) {
        // Успешная регистрация
        return true;
      } else {
        // Обработка ошибок при регистрации
        return false;
      }
    } catch (e) {
      // Обработка ошибок сети или других исключений
      return false;
    }
  }
}
