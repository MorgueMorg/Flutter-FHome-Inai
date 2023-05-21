import 'package:fhome/components/constants.dart';
import 'package:fhome/components/size_config.dart';
import 'package:fhome/features/screens/email/components/email_form.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.05), // 10%
              Text(
                "Подтверждение почты",
                textAlign: TextAlign.center,
                style: headingStyle,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.01),
              const Text(
                "Мы отправили ваш код по адресу *******@gmail.com.",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.01),
              buildTimer(),
              SizedBox(height: SizeConfig.screenHeight * 0.10), // 10%
              const EmailForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.1), // 10%
              GestureDetector(
                onTap: () {
                  // resend Email code
                },
                child: const Text(
                  "Отправить код повторно",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Срок действия этого кода истекает через "),
        TweenAnimationBuilder(
          tween: Tween(begin: 60.0, end: 0),
          duration: const Duration(seconds: 60), // because we allow user 30s
          builder: (context, value, child) => Text(
            "00:${value.toInt()}",
            style: const TextStyle(color: lightPink),
          ),
          onEnd: () {},
        )
      ],
    );
  }
}
