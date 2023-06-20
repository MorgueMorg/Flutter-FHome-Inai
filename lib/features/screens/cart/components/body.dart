import 'package:fhome/components/constants.dart';
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
          SizedBox(height: getProportionateScreenHeight(20)),
          BlocBuilder<CartCubit, List<Product>>(
            builder: (context, state) {
              return state.isEmpty
                  ? const Center(
                      child: Text(
                        'Cart is empty',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    )
                  // ? If the cart is not empty
                  : Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.length,
                        itemBuilder: (context, index) {
                          final product = state[index];
                          return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.network(
                                  product.photo,
                                  height: getProportionateScreenHeight(50),
                                  width: getProportionateScreenWidth(50),
                                ),
                              ),
                              trailing: BlocBuilder<CartCubit, List<Product>>(
                                builder: (context, state) {
                                  return IconButton(
                                    icon: const Icon(
                                      Icons.close,
                                      color: darkPink,
                                    ),
                                    onPressed: () {
                                      context
                                          .read<CartCubit>()
                                          .removeProduct(product);
                                    },
                                  );
                                },
                              ),
                              title: Text(product.title),
                              subtitle: Text(
                                "${product.price} som",
                                style: const TextStyle(
                                    color: darkPink,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16),
                              ),
                            ),
                          );
                        },
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}
