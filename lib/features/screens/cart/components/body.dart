import 'package:fhome/components/size_config.dart';
import 'package:fhome/features/cubit/cartFeature/cart_cubit.dart';
import 'package:fhome/repositories/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Column(
        children: [
          Text("Корзина"),
          BlocBuilder<CartCubit, List<Product>>(
            builder: (context, state) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.length,
                itemBuilder: (context, index) {
                  final product = state[index];
                  return ListTile(
                    title: Text(product.title),
                    subtitle: Text("${product.price} som"),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
