import 'package:fhome/components/constants.dart';
import 'package:fhome/components/size_config.dart';
import 'package:fhome/features/screens/details/product_details_screen.dart';
import 'package:fhome/repositories/models/product_model.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.singlePost,
  });

  final Product singlePost;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Image.network(
          singlePost.photo,
          height: getProportionateScreenHeight(50),
          width: getProportionateScreenWidth(50),
        ),
      ),
      trailing: Text(
        "${singlePost.price} сом",
        style: const TextStyle(
            color: darkPink, fontWeight: FontWeight.w700, fontSize: 16),
      ),
      title: Text(singlePost.title),
      subtitle: Text('${singlePost.description.substring(0, 28)}...'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ProductDetailsScreen(productId: singlePost.id),
          ),
        );
      },
    );
  }
}
