import 'package:dio/dio.dart';

class UsersService {
  static Future<int> getLastUserId() async {
    try {
      final response =
          await Dio().get('https://fhome.onrender.com/api/user/all');
      if (response.statusCode == 200) {
        final List<dynamic> usersData = response.data;
        if (usersData.isNotEmpty) {
          final lastUser = usersData.last;
          final int lastUserId = lastUser['id'];
          return lastUserId;
        }
      }
    } catch (e) {
      print('Error retrieving user list: $e');
    }
    return 0; // Вернуть 0, если список пользователей пуст
  }
}
