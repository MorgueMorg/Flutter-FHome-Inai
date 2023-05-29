import 'package:fhome/repositories/models/registration_model.dart';
import 'package:http/http.dart' as http;

import '../components/api_constants.dart';

class RegistrationService {
  Future<bool> register(RegistrationModel registrationModel) async {
    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse('$baseUrl/user/registration'));

      request.fields['email'] = registrationModel.email;
      request.fields['password'] = registrationModel.password;
      request.fields['fullName'] = registrationModel.fullName;
      request.fields['birthday'] = registrationModel.birthday;
      request.fields['phone'] = registrationModel.phone;
      request.fields['userInfo'] = registrationModel.userInfo;

      var response = await request.send();
      if (response.statusCode == 200) {
        // Регистрашка прошла
        return true;
      } else {
        // Не прошла
        return false;
      }
    } catch (e) {
      // Всякие ошибки
      return false;
    }
  }
}
