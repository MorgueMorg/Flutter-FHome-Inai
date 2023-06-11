import 'package:fhome/components/custom_bottom_nav_bar.dart';
import 'package:fhome/components/menu_enums.dart';
import 'package:fhome/features/screens/favorites/components/body.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  static String routeName = "/favorites";
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Избранное"),
      ),
      body: const Body(),
      bottomNavigationBar: const CustomBottomNavBar(
        selectedMenu: MenuState.favorites,
      ),
    );
  }
}
