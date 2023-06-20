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
                "Email Confirmation",
                textAlign: TextAlign.center,
                style: headingStyle,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.01),
              const Text(
                "We sent the code to the mail you specified ",
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
                  "Resend code",
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
        const Text("This code expires in "),
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
