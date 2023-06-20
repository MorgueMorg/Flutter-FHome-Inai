import 'package:fhome/features/screens/cart/cart_screen.dart';
import 'package:fhome/features/screens/favorites/favorites_screen.dart';
import 'package:fhome/features/screens/home/components/categories/categories_details.dart';
import 'package:fhome/features/screens/notices/notices_screen.dart';
import 'package:fhome/features/screens/product_details/product_details_screen.dart';
import 'package:fhome/features/screens/email/email_screen.dart';
import 'package:fhome/features/screens/forgot_password/forgot_password_screen.dart';
import 'package:fhome/features/screens/home/home_screen.dart';
import 'package:fhome/features/screens/login_success/login_success_screen.dart';
import 'package:fhome/features/screens/profile/profile_screen.dart';
import 'package:fhome/features/screens/sign_in/sign_in_screen.dart';
import 'package:fhome/features/screens/sign_up/sign_up_screen.dart';
import 'package:fhome/features/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  EmailScreen.routeName: (context) => const EmailScreen(),
  LoginSuccessScreen.routeName: (context) => const LoginSuccessScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
  // ! It asks for productId, but it doesn't affect anything either
  ProductDetailsScreen.routeName: (context) =>
      const ProductDetailsScreen(productId: 1),
  CategoryDetails.routeName: (context) => CategoryDetails(
        categoryId: ModalRoute.of(context)?.settings.arguments as int? ?? 0,
      ),
  CartScreen.routeName: (context) => const CartScreen(),
  NoticesScreen.routeName: (context) => const NoticesScreen(),
  FavoritesScreen.routeName: (context) => const FavoritesScreen(),
};
