import 'package:fhome/features/screens/forgot_password/components/body.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/forgot_password";

  const ForgotPasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Восстановление пароля"),
      ),
      body: const Body(),
    );
  }
}
