import 'package:fhome/components/size_config.dart';
import 'package:fhome/features/cubit/cartFeature/cart_cubit.dart';
import 'package:fhome/features/screens/cart/cart_screen.dart';
import 'package:fhome/features/screens/home/components/icon_btn_with_counter.dart';
import 'package:fhome/features/screens/notices/notices_screen.dart';
import 'package:fhome/repositories/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          BlocConsumer<CartCubit, List<Product>>(
            listener: (context, state) {},
            builder: (context, state) {
              final numOfItems = state.length;
              return IconBtnWithCounter(
                svgSrc: "assets/icons/Cart Icon.svg",
                numOfItems: numOfItems,
                press: () {
                  Navigator.pushNamed(context, CartScreen.routeName);
                },
              );
            },
          ),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Bell.svg",
            // В будущем реализую функционал уведомлений, возможно с firebase
            numOfItems: 0,
            press: () {
              Navigator.pushNamed(context, NoticesScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
