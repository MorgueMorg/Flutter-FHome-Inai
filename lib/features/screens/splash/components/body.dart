import 'package:fhome/components/constants.dart';
import 'package:fhome/features/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:fhome/components/default_button.dart';
import 'package:fhome/components/size_config.dart';
// import 'package:rive/rive.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const SizedBox(height: 30),
            Text(
              "FHome",
              style: TextStyle(
                fontSize: getProportionateScreenHeight(36),
                color: lightPink,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Welcome to FHOME, Let's shop!",
              textAlign: TextAlign.center,
              style: TextStyle(color: darkPink),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: getProportionateScreenHeight(250),
              width: getProportionateScreenWidth(250),
              child: Image.asset("assets/images/giphycake.webp"),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: getProportionateScreenWidth(190),
              child: DefaultButton(
                text: "Continue",
                press: () {
                  Navigator.pushNamed(context, SignInScreen.routeName);
                },
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
