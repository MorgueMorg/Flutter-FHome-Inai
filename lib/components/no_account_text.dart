import 'package:fhome/components/constants.dart';
import 'package:fhome/components/size_config.dart';
import 'package:flutter/material.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Нет аккаунта? ",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(16),
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, "/sign_up"),
          child: Text(
            "Зарегистрируйтесь",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16), color: lightPink),
          ),
        )
      ],
    );
  }
}
