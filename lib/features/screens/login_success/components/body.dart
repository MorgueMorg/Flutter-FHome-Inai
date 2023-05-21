import 'package:fhome/components/constants.dart';
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
        // SizedBox(
        //   height: SizeConfig.screenHeight * 0.04,
        // ),
        const Spacer(),
        Container(
          alignment: Alignment.center, // use aligment
          // color: Color.fromRGBO(0, 96, 91, 1),
          child: Image.network(
              // "https://cdn-icons-png.flaticon.com/512/5251/5251301.png",
              "https://i0.wp.com/flowingedge.com/wp-content/uploads/2021/07/check-pink.png?fit=400%2C400&ssl=1",
              // "https://handboundcostumes.co.uk/wp-content/uploads/2020/02/pink-tick.jpg",
              height: 200,
              width: 200,
              fit: BoxFit.cover),
        ),
        const Spacer(),
        Text(
          "Успешный вход!",
          style: TextStyle(
              fontSize: getProportionateScreenWidth(30),
              fontWeight: FontWeight.bold,
              color: lightPink),
        ),
        const Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: "На главную",
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
