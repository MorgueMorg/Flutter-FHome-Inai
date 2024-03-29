import 'package:fhome/features/screens/email/components/body.dart';
import 'package:flutter/material.dart';

class EmailScreen extends StatelessWidget {
  static String routeName = "/email";

  const EmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Подтверждение почты"),
      ),
      body: const Body(),
    );
  }
}
