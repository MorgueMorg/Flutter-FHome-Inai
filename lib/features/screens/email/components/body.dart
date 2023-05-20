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
                "Email Verification",
                style: headingStyle,
              ),
              const Text("We sent your code to +*******@gmail.com"),
              buildTimer(),
              SizedBox(height: SizeConfig.screenHeight * 0.15), // 10%
              const EmailForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.1), // 10%
              GestureDetector(
                onTap: () {
                  // resend Email code
                },
                child: const Text(
                  "Resend Email Code",
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
        const Text("This code will expired in "),
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
