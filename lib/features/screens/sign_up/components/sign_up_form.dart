import 'package:fhome/components/api_constants.dart';
import 'package:fhome/components/constants.dart';
import 'package:fhome/service/registration_service.dart';
import 'package:flutter/material.dart';
import 'package:fhome/components/default_button.dart';
import 'package:fhome/components/form_error.dart';
import 'package:fhome/components/size_config.dart';
import 'package:fhome/features/screens/complete_profile/complete_profile_screen.dart';
import 'package:fhome/repositories/models/registration_model.dart';
import 'package:http/http.dart' as http;

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  String? email;
  String? password;
  String? fullName;
  String? birthday;
  String? phone;
  String? userInfo;
  // String? confirmPassword;
  final List<String?> errors = [];

  RegistrationService _registrationService = RegistrationService();

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  void _register() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      RegistrationModel registrationModel = RegistrationModel(
        email: email!,
        password: password!,
        fullName: fullName!,
        birthday: birthday!,
        phone: phone!,
        userInfo: userInfo!,
      );

      bool isRegistered =
          await _registrationService.register(registrationModel);

      if (isRegistered) {
        // Registration successful
        Navigator.pushNamed(context, CompleteProfileScreen.routeName);
      } else {
        // Registration failed
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Ошибка"),
              content: const Text("Не удалось зарегистрироваться."),
              actions: <Widget>[
                TextButton(
                  child: const Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }

  Future<bool> _sendRegistrationRequest(
      RegistrationModel registrationModel) async {
    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse('$baseUrl/user/registration'));

      request.fields['email'] = registrationModel.email;
      request.fields['password'] = registrationModel.password;
      request.fields['fullName'] = registrationModel.fullName;
      request.fields['birthday'] = registrationModel.birthday;
      request.fields['phone'] = registrationModel.phone;
      request.fields['userInfo'] = registrationModel.userInfo;

      // ! Вот так потом буду грозить фотку
      // var photoFile = await http.MultipartFile.fromPath('photo', registrationModel.photo, contentType: MediaType('image', 'jpeg'));
      // request.files.add(photoFile);

      var response = await request.send();
      if (response.statusCode == 200) {
        // Successful registration
        return true;
      } else {
        // Registration failed
        return false;
      }
    } catch (e) {
      // Network or other exceptions
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => email = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: "Введите вашу почту");
              } else if (emailValidatorRegExp.hasMatch(value)) {
                removeError(error: "Неверный формат почты");
              }
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: "Введите вашу почту");
                return "";
              } else if (!emailValidatorRegExp.hasMatch(value)) {
                addError(error: "Неверный формат почты");
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Почта",
              hintText: "Введите вашу почту",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          TextFormField(
            obscureText: true,
            controller: _passwordController,
            onSaved: (newValue) => password = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: "Введите ваш пароль");
              } else if (value.length >= 8) {
                removeError(error: "Пароль слишком короткий");
              }
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: "Введите ваш пароль");
                return "";
              } else if (value.length < 8) {
                addError(error: "Пароль слишком короткий");
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Пароль",
              hintText: "Введите ваш пароль",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          // TextFormField(
          //   obscureText: true,
          //   controller: _confirmPasswordController,
          //   onSaved: (newValue) => confirmPassword = newValue,
          //   onChanged: (value) {
          //     if (value.isNotEmpty) {
          //       removeError(error: "Подтвердите ваш пароль");
          //     } else if (value.isNotEmpty &&
          //         value == _passwordController.text) {
          //       removeError(error: "Пароли не совпадают");
          //     }
          //   },
          //   validator: (value) {
          //     if (value!.isEmpty) {
          //       addError(error: "Подтвердите ваш пароль");
          //       return "";
          //     } else if (value != _passwordController.text) {
          //       addError(error: "Пароли не совпадают");
          //       return "";
          //     }
          //     return null;
          //   },
          //   decoration: const InputDecoration(
          //     labelText: "Подтверждение пароля",
          //     hintText: "Подтвердите ваш пароль",
          //     floatingLabelBehavior: FloatingLabelBehavior.always,
          //   ),
          // ),
          SizedBox(height: getProportionateScreenHeight(40)),
          TextFormField(
            keyboardType: TextInputType.text,
            onSaved: (newValue) => fullName = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: "Введите ваше имя");
              }
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: "Введите ваше имя");
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Имя",
              hintText: "Введите ваше имя",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(40)),
          TextFormField(
            keyboardType: TextInputType.text,
            onSaved: (newValue) => birthday = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: "Введите ваш день рождения");
              }
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: "Введите ваше рождение");
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Дата",
              hintText: "Введите рождения",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(40)),
          TextFormField(
            keyboardType: TextInputType.text,
            onSaved: (newValue) => phone = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: "Введите ваш номер");
              }
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: "Введите ваше номер");
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Номер",
              hintText: "Телефона",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(40)),
          TextFormField(
            keyboardType: TextInputType.text,
            onSaved: (newValue) => userInfo = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: "Введите инфу");
              }
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: "Введите ваше инфу");
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "инфа",
              hintText: "Введите ваше инфа",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Продолжить",
            press: _register,
          ),
        ],
      ),
    );
  }
}
