import 'package:fhome/components/default_button.dart';
import 'package:fhome/components/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fhome/components/constants.dart';
import 'package:fhome/features/cubit/productDetails/product_details_cubit.dart';

class ProductDetailsBody extends StatefulWidget {
  final int productId;

  const ProductDetailsBody({Key? key, required this.productId})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProductDetailsBodyState createState() => _ProductDetailsBodyState();
}

class _ProductDetailsBodyState extends State<ProductDetailsBody> {
  late ProductDetailsCubit productDetailsCubit;

  @override
  void initState() {
    super.initState();
    productDetailsCubit = context.read<ProductDetailsCubit>();
    productDetailsCubit.fetchProductDetails(widget.productId);
  }

  Future<void> _refreshData() async {
    productDetailsCubit.fetchProductDetails(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    productDetailsCubit = context.read<ProductDetailsCubit>();
    return RefreshIndicator(
      color: darkPink,
      onRefresh: _refreshData,
      child: Column(
        children: [
          Expanded(
            child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
              builder: (context, state) {
                if (state is ProductDetailsLoading) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: darkPink,
                  ));
                } else if (state is ProductDetailsLoaded) {
                  final product = state.product;
                  return ListView(
                    children: [
                      Center(
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image.network(
                                product.photo,
                                height: getProportionateScreenHeight(300),
                                width: getProportionateScreenWidth(300),
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(10),
                            ),
                            Text(
                              product.title,
                              style: headingStyle,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(20),
                            ),
                            Text(
                              "${product.price} som",
                              style: const TextStyle(
                                  color: lightPink,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(20),
                            ),
                            Text(
                              product.description,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w400),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(50),
                            ),
                            SizedBox(
                              width: SizeConfig.screenWidth * 0.7,
                              child: DefaultButton(
                                text: "Купить",
                                press: () {},
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  );
                } else if (state is ProductDetailsError) {
                  return Center(child: Text('Error: ${state.error}'));
                } else {
                  return Container(); // Handle other states if necessary
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
