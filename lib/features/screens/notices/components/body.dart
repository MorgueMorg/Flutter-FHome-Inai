import 'package:flutter/widgets.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    // Позже решу как сделать уведомления, да и апишки под это пока нет
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/notices.gif",
              height: 250, width: 250, fit: BoxFit.cover),
          const Text(
            "Уведомлений нет",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
