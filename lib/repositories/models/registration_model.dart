class RegistrationModel {
  // Позже будет добавлена фотография профиля
  final String email;
  // final String photo;
  final String password;
  final String fullName;
  final String birthday;
  final String phone;
  final String userInfo;

  RegistrationModel(
      {required this.email,
      // required this.photo,
      required this.password,
      required this.fullName,
      required this.birthday,
      required this.phone,
      required this.userInfo});

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      // "photo": photo,
      "password": password,
      "fullName": fullName,
      "birthday": birthday,
      "phone": phone,
      "userInfo": userInfo,
    };
  }
}
