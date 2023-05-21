import 'package:fhome/features/screens/complete_profile/complete_profile_screen.dart';
import 'package:fhome/features/screens/email/email_screen.dart';
import 'package:fhome/features/screens/forgot_password/forgot_password_screen.dart';
import 'package:fhome/features/screens/home/home_screen.dart';
import 'package:fhome/features/screens/login_success/login_success_screen.dart';
import 'package:fhome/features/screens/sign_in/sign_in_screen.dart';
import 'package:fhome/features/screens/sign_up/sign_up_screen.dart';
import 'package:fhome/features/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => const CompleteProfileScreen(),
  EmailScreen.routeName: (context) => const EmailScreen(),
  LoginSuccessScreen.routeName: (context) => const LoginSuccessScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
};
