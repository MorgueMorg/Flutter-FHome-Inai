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
              return Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.length,
                  itemBuilder: (context, index) {
                    final product = state[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.network(
                            product.photo,
                            height: getProportionateScreenHeight(50),
                            width: getProportionateScreenWidth(50),
                          ),
                        ),
                        trailing: Text(
                          "${product.price} сом",
                          style: const TextStyle(
                              color: darkPink,
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                        ),
                        title: Text(product.title),
                        subtitle:
                            Text('${product.description.substring(0, 28)}...'),
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
