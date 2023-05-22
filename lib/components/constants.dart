import 'package:fhome/components/size_config.dart';
import 'package:flutter/material.dart';

const lightPink = Color(0xFFF380B9);
const darkPink = Color(0xFFC2528B);
const lightPurple = Color(0xFF9652C2);
const darkPurple = Color(0xFF5F50A9);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  // color: Colors.black,
  color: darkPink,
  height: 1.5,
);

// Form Errors
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Пожалуйста введите вашу почту";
const String kInvalidEmailError = "Пожалуйста укажите валидную почту";
const String kPassNullError = "Пожалуйста введите ваш пароль";
const String kShortPassError = "Пароль слишком короткий";
const String kMatchPassError = "Пароли не совпадают";
const String kNamelNullError = "Пожалуйста введите ваше имя";
const String kPhoneNumberNullError = "Пожалуйста введите ваш номер телефона";
const String kAddressNullError = "Пожалуйста введите ваш адрес";

final emailInputDecoration = InputDecoration(
    contentPadding:
        EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
    enabledBorder: outlineInputBorder(),
    focusedBorder: outlineInputBorder(),
    border: outlineInputBorder());

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(color: kTextColor),
  );
}
