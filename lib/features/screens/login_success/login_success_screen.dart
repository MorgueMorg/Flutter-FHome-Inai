import 'package:fhome/features/screens/login_success/components/body.dart';
import 'package:flutter/material.dart';

class LoginSuccessScreen extends StatelessWidget {
  static String routeName = "/login_success";

  const LoginSuccessScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Leading removes arrow back
        leading: const SizedBox(),
        title: const Text("Вход прошел успешно"),
      ),
      body: const Body(),
    );
  }
}
