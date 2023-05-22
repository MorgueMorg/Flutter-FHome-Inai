import 'package:fhome/components/constants.dart';
import 'package:fhome/components/default_button.dart';
import 'package:fhome/components/size_config.dart';
import 'package:fhome/features/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class EmailForm extends StatefulWidget {
  const EmailForm({super.key});

  @override
  State<EmailForm> createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
    super.dispose();
  }

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  autofocus: true,
                  // obscureText: true,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                  decoration: emailInputDecoration,
                  onChanged: (value) {
                    // also you need to store the value
                    nextField(value, pin2FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: pin2FocusNode,
                  // obscureText: true,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                  decoration: emailInputDecoration,
                  onChanged: (value) {
                    nextField(value, pin3FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: pin3FocusNode,
                  // obscureText: true,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                  decoration: emailInputDecoration,
                  onChanged: (value) {
                    nextField(value, pin4FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: pin4FocusNode,
                  // obscureText: true,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                  decoration: emailInputDecoration,
                  onChanged: (value) {
                    pin4FocusNode!.unfocus();
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          DefaultButton(
            text: "Продолжить",
            press: () {
              Navigator.pushNamed(context, HomeScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
