import 'package:fhome/features/screens/profile/components/profile_menu.dart';
import 'package:fhome/features/screens/profile/components/profile_pic.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ProfilePic(),
        const SizedBox(height: 20),
        ProfileMenu(
          icon: "assets/icons/User Icon.svg",
          text: "Аккаунт",
          press: () {},
        ),
        ProfileMenu(
          icon: "assets/icons/Bell.svg",
          text: "Уведомления",
          press: () {},
        ),
        ProfileMenu(
          icon: "assets/icons/Settings.svg",
          text: "Настройки",
          press: () {},
        ),
        ProfileMenu(
          icon: "assets/icons/Question mark.svg",
          text: "Тех-поддержка",
          press: () {},
        ),
        ProfileMenu(
          icon: "assets/icons/Log out.svg",
          text: "Выйти",
          press: () {},
        ),
      ],
    );
  }
}
