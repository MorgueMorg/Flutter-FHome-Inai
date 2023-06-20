import 'package:fhome/components/constants.dart';
import 'package:fhome/components/default_button.dart';
import 'package:fhome/components/size_config.dart';
import 'package:fhome/features/cubit/cartFeature/cart_cubit.dart';
import 'package:fhome/features/screens/cart/components/body.dart';
import 'package:fhome/repositories/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const Body(),
      bottomNavigationBar: const CheckOurCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: const Column(
        children: [
          Text(
            "Корзина",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}

class CheckOurCard extends StatelessWidget {
  const CheckOurCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(15),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  height: getProportionateScreenWidth(40),
                  width: getProportionateScreenWidth(40),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.fact_check_rounded,
                    color: lightPink,
                  ),
                ),
                const Spacer(),
                Text(
                  "Добавить КПП чек",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: lightPink,
                )
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<CartCubit, List<Product>>(
                  builder: (context, state) {
                    double totalAmount = 0;
                    for (var product in state) {
                      totalAmount += product.price;
                    }
                    return Text.rich(
                      TextSpan(
                        text: "Сумма:\n",
                        children: [
                          TextSpan(
                            text: "$totalAmount сом",
                            style:
                                const TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(
                  width: getProportionateScreenWidth(190),
                  child: DefaultButton(
                    text: "Оформить заказ",
                    press: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
