import 'package:fhome/features/screens/home/components/body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      // bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
