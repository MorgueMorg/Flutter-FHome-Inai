import 'package:fhome/features/screens/notices/components/body.dart';
import 'package:flutter/material.dart';

class NoticesScreen extends StatelessWidget {
  static String routeName = "/notices";
  const NoticesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Уведомления"),
      ),
      body: const Body(),
    );
  }
}
