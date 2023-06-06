import 'package:fhome/components/constants.dart';
import 'package:fhome/components/size_config.dart';
import 'package:fhome/features/cubit/productFeature/product_fetch_cubit.dart';
import 'package:fhome/features/screens/home/components/carousel.dart';
import 'package:fhome/features/screens/home/components/categories/categories.dart';
import 'package:fhome/features/screens/home/components/home_header.dart';
import 'package:fhome/features/screens/home/components/products/fetch_bloc_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late ProductFetchCubit productFetchCubit;
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    productFetchCubit = context.read<ProductFetchCubit>();
  }

  Future<void> _refreshData() async {
    productFetchCubit.fetchProductApi();
  }

  void _onSearchChanged(String query) {
    setState(() {
      searchQuery = query;
    });
    // Обновление листа продуктов с учетом поискового запроса
    productFetchCubit.searchProducts(query);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: darkPink,
      onRefresh: _refreshData,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenWidth(15)),
              HomeHeader(
                onSearchChanged: _onSearchChanged,
              ),
              SizedBox(height: getProportionateScreenWidth(30)),
              const Carousel(),
              SizedBox(height: getProportionateScreenWidth(20)),
              const Categories(),
              SizedBox(height: getProportionateScreenWidth(0)),
              FetchBlocProducts(
                searchQuery: searchQuery,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
