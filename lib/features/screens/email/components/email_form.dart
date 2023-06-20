import 'package:fhome/components/constants.dart';
import 'package:fhome/components/default_button.dart';
import 'package:fhome/components/size_config.dart';
import 'package:fhome/features/screens/home/home_screen.dart';
import 'package:fhome/service/email_service.dart';
import 'package:fhome/service/users_service.dart';
import 'package:flutter/material.dart';

class EmailForm extends StatefulWidget {
  const EmailForm({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EmailFormState createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  late TextEditingController _pin1Controller;
  late TextEditingController _pin2Controller;
  late TextEditingController _pin3Controller;
  late TextEditingController _pin4Controller;
  late FocusNode _pin2FocusNode;
  late FocusNode _pin3FocusNode;
  late FocusNode _pin4FocusNode;

  @override
  void initState() {
    super.initState();
    _pin1Controller = TextEditingController();
    _pin2Controller = TextEditingController();
    _pin3Controller = TextEditingController();
    _pin4Controller = TextEditingController();
    _pin2FocusNode = FocusNode();
    _pin3FocusNode = FocusNode();
    _pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    _pin1Controller.dispose();
    _pin2Controller.dispose();
    _pin3Controller.dispose();
    _pin4Controller.dispose();
    _pin2FocusNode.dispose();
    _pin3FocusNode.dispose();
    _pin4FocusNode.dispose();
    super.dispose();
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  Future<void> verifyCodeAndNavigate(BuildContext context) async {
    final lastUserId = await UsersService.getLastUserId();
    final code = _pin1Controller.text +
        _pin2Controller.text +
        _pin3Controller.text +
        _pin4Controller.text;

    try {
      // Возвращаю последний айди из списка юзеров (по идее он последний ведь проходит регистрашку. Костыль, но я устал писать бэкендеру)
      final response =
          await EmailService.verifyCode(lastUserId.toString(), code);
      if (response.statusCode == 200) {
        // ignore: use_build_context_synchronously
        Navigator.pushNamed(context, HomeScreen.routeName);
      } else {
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Ошибка'),
            content: const Text(
                'Неправильный код подтверждения. Пожалуйста, введите правильный код.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    } catch (error) {
      // Обработка ошибки при подтверждении кода
      // ignore: avoid_print
      print("Произошла ошибка при подтверждении кода: $error");
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
                  controller: _pin1Controller,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                  decoration: emailInputDecoration,
                  onChanged: (value) {
                    nextField(value, _pin2FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: _pin2FocusNode,
                  controller: _pin2Controller,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                  decoration: emailInputDecoration,
                  onChanged: (value) {
                    nextField(value, _pin3FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: _pin3FocusNode,
                  controller: _pin3Controller,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                  decoration: emailInputDecoration,
                  onChanged: (value) {
                    nextField(value, _pin4FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: _pin4FocusNode,
                  controller: _pin4Controller,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                  decoration: emailInputDecoration,
                  onChanged: (value) {
                    _pin4FocusNode.unfocus();
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          DefaultButton(
            text: 'Продолжить',
            press: () {
              verifyCodeAndNavigate(context);
            },
          ),
        ],
      ),
    );
  }
}
