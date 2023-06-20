import 'package:fhome/features/cubit/cartFeature/cart_cubit.dart';
import 'package:fhome/features/cubit/favoritesFeature/favorites_cubit.dart';
import 'package:fhome/features/cubit/productFeature/product_fetch_cubit.dart';
import 'package:fhome/features/cubit/productDetails/product_details_cubit.dart';
import 'package:fhome/features/screens/product_details/product_details_screen.dart';
import 'package:fhome/features/screens/splash/splash_screen.dart';
import 'package:fhome/repositories/product_repository/product_repository.dart';
import 'package:fhome/router/routes.dart';
import 'package:fhome/service/product_service.dart';
import 'package:fhome/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp(
    productService: ProductService(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.productService}) : super(key: key);

  final ProductService productService;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductFetchCubit>(
          create: (context) => ProductFetchCubit(
            apiRepository: ProductRepository(
              productService: productService,
            ),
          )..fetchProductApi(),
        ),
        BlocProvider(
          create: (context) => ProductDetailsCubit(),
          // ! Asking for an argument, but it doesn't affect anything.
          child: const ProductDetailsScreen(productId: 0),
        ),
        BlocProvider<CartCubit>(
          create: (context) => CartCubit(),
        ),
        BlocProvider<FavoritesCubit>(
          create: (context) => FavoritesCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FHome',
        theme: theme(),
        initialRoute: SplashScreen.routeName,
        routes: routes,
      ),
    );
  }
}
