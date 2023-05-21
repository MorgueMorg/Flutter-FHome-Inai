import 'package:fhome/components/constants.dart';
import 'package:fhome/components/custom_bottom_nav_bar.dart';
import 'package:fhome/features/screens/home/components/body.dart';
import 'package:fhome/service/menu_enums.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: lightPink,
        ),
        title: const Text("Главная"),
      ),
      body: const Body(),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
