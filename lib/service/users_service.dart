import 'package:dio/dio.dart';
import 'package:fhome/components/api_constants.dart';

class UsersService {
  static Future<int> getLastUserId() async {
    try {
      final response = await Dio().get('$baseUrl/user/all');
      if (response.statusCode == 200) {
        // Сериализашка
        final List<dynamic> usersData = response.data;
        if (usersData.isNotEmpty) {
          final lastUser = usersData.last;
          final int lastUserId = lastUser['id'];
          return lastUserId;
        }
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error retrieving user list: $e');
    }
    return 0; // Вернуть 0, если список пользователей пуст
  }
}
