import 'package:fhome/components/constants.dart';
import 'package:fhome/components/size_config.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const SearchField({
    Key? key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.6,
      decoration: BoxDecoration(
        color: lightPink.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: getProportionateScreenWidth(15),
          ),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          hintText: "Поиск",
          prefixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }
}
