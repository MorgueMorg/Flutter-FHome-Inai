import 'package:fhome/components/size_config.dart';
import 'package:fhome/features/screens/splash/components/body.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";

  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    // ! CALL THIS METHOD IDIOT
    SizeConfig().init(context);
    return const Scaffold(
      body: Body(),
    );
  }
}
