import 'package:fhome/features/cubit/product_fetch_cubit.dart';
import 'package:fhome/features/screens/splash/splash_screen.dart';
import 'package:fhome/repositories/product_repository/product_repository.dart';
import 'package:fhome/router/routes.dart';
import 'package:fhome/service/api_service.dart';
import 'package:fhome/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp(
    apiService: ApiService(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.apiService}) : super(key: key);

  final ApiService apiService;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductFetchCubit>(
          create: (context) => ProductFetchCubit(
            apiRepository: ProductRepository(
              apiService: apiService,
            ),
          )..fetchProductApi(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: theme(),
        initialRoute: SplashScreen.routeName,
        routes: routes,
      ),
    );
  }
}
