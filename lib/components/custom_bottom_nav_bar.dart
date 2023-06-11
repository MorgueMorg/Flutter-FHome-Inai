import 'package:fhome/components/constants.dart';
import 'package:fhome/features/screens/favorites/favorites_screen.dart';
import 'package:fhome/features/screens/home/home_screen.dart';
import 'package:fhome/features/screens/profile/profile_screen.dart';
import 'package:fhome/components/menu_enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.selectedMenu,
  });

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    const Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, -15),
              blurRadius: 20,
              color: const Color(0xFFDADADA).withOpacity(0.15)),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, HomeScreen.routeName);
              },
              icon: SvgPicture.asset("assets/icons/Shop Icon.svg",
                  color: MenuState.home == selectedMenu
                      ? lightPink
                      : inActiveIconColor),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, FavoritesScreen.routeName);
              },
              icon: SvgPicture.asset("assets/icons/Heart Icon.svg",
                  color: MenuState.favourite == selectedMenu
                      ? lightPink
                      : inActiveIconColor),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, ProfileScreen.routeName);
              },
              icon: SvgPicture.asset("assets/icons/User Icon.svg",
                  color: MenuState.profile == selectedMenu
                      ? lightPink
                      : inActiveIconColor),
            ),
          ],
        ),
      ),
    );
  }
}
