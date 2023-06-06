import 'package:fhome/components/size_config.dart';
import 'package:fhome/features/screens/cart/cart_screen.dart';
import 'package:fhome/features/screens/home/components/icon_btn_with_counter.dart';
import 'package:flutter/material.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  final ValueChanged<String>? onSearchChanged;

  const HomeHeader({
    Key? key,
    this.onSearchChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(
            onChanged: onSearchChanged,
          ),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Cart Icon.svg",
            press: () {
              Navigator.pushNamed(context, CartScreen.routeName);
            },
          ),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Bell.svg",
            numOfitem: 3,
            press: () {},
          ),
        ],
      ),
    );
  }
}
