import 'package:fhome/components/api_constants.dart';
import 'package:fhome/components/constants.dart';
import 'package:fhome/features/screens/email/email_screen.dart';
import 'package:fhome/service/registration_service.dart';
import 'package:flutter/material.dart';
import 'package:fhome/components/default_button.dart';
import 'package:fhome/components/form_error.dart';
import 'package:fhome/components/size_config.dart';
import 'package:fhome/repositories/models/registration_model.dart';
import 'package:http/http.dart' as http;

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  // ignore: unused_field
  final TextEditingController _confirmPasswordController =
      TextEditingController(); // переменная для подтверждения пароля
  String? email;
  String? password;
  String? fullName;
  String? birthday;
  String? phone;
  String? userInfo;
  String? confirmPassword;
  final List<String?> errors = [];

  final RegistrationService _registrationService = RegistrationService();

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
        // ignore: use_build_context_synchronously
        Navigator.pushNamed(context, EmailScreen.routeName);
      } else {
        // Registration failed
        // ignore: use_build_context_synchronously
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

  // ignore: unused_element
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
                removeError(error: "Enter your password");
              } else if (emailValidatorRegExp.hasMatch(value)) {
                removeError(error: "Incorrect email format");
              }
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: "Enter your password");
                return "";
              } else if (!emailValidatorRegExp.hasMatch(value)) {
                addError(error: "Incorrect email format");
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Email",
              hintText: "Enter your email",
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
                removeError(error: "Enter your password");
              } else if (value.length >= 8) {
                removeError(error: "Password is too short");
              }
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: "Enter your password");
                return "";
              } else if (value.length < 8) {
                addError(error: "Пароль слишком короткий");
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Password",
              hintText: "Enter your password",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          TextFormField(
            obscureText: true,
            controller: _confirmPasswordController,
            onSaved: (newValue) => confirmPassword = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: "Confirm your password");
              } else if (value.isNotEmpty &&
                  value == _passwordController.text) {
                removeError(error: "Passwords do not match");
              }
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: "Confirm your password");
                return "";
              } else if (value != _passwordController.text) {
                addError(error: "Passwords do not match");
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Confirm password",
              hintText: "Confirm your password",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(40)),
          TextFormField(
            keyboardType: TextInputType.text,
            onSaved: (newValue) => fullName = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: "Enter your fullname");
              }
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: "Enter your fullname");
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Name",
              hintText: "Enter your fullname",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(40)),
          TextFormField(
            keyboardType: TextInputType.text,
            onSaved: (newValue) => birthday = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: "Enter your date of birth");
              }
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: "Enter your date of birth");
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Birth Date",
              hintText: "DD/MM/YYYY",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(40)),
          TextFormField(
            keyboardType: TextInputType.text,
            onSaved: (newValue) => phone = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: "Enter your phone number");
              }
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: "The phone number cannot be empty");
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Phone Number",
              hintText: "Enter your phone number",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(40)),
          TextFormField(
            keyboardType: TextInputType.text,
            onSaved: (newValue) => userInfo = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(
                    error: "Enter a correct description of your company");
              }
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: "The description cannot be empty");
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Additionally",
              hintText: "Enter your company description",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Continue",
            press: _register,
          ),
        ],
      ),
    );
  }
}
