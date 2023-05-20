import 'package:fhome/components/default_button.dart';
import 'package:fhome/components/size_config.dart';
import 'package:fhome/features/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: SizeConfig.screenHeight * 0.04,
        ),
        Container(
          alignment: Alignment.center, // use aligment
          // color: Color.fromRGBO(0, 96, 91, 1),
          child: Image.network(
              "https://cdn-icons-png.flaticon.com/512/5251/5251301.png",
              height: 200,
              width: 200,
              fit: BoxFit.cover),
        ),
        SizedBox(
          // TODO
          height: SizeConfig.screenHeight * 0.04,
        ),
        Text(
          "Login Success",
          style: TextStyle(
              fontSize: getProportionateScreenWidth(30),
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
        const Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: "Back to Home",
            press: () {
              Navigator.pushNamed(context, HomeScreen.routeName);
            },
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
