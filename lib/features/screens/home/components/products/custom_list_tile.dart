import 'package:fhome/components/constants.dart';
import 'package:fhome/components/size_config.dart';
import 'package:fhome/features/cubit/favoritesFeature/favorites_cubit.dart';
import 'package:fhome/features/screens/product_details/product_details_screen.dart';
import 'package:fhome/repositories/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.singlePost,
  }) : super(key: key);

  final Product singlePost;

  @override
  Widget build(BuildContext context) {
    final favoritesCubit = context.watch<FavoritesCubit>();

    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Image.network(
          singlePost.photo,
          height: getProportionateScreenHeight(50),
          width: getProportionateScreenWidth(50),
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "${singlePost.price} som",
            style: const TextStyle(
              color: darkPink,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          IconButton(
            onPressed: () {
              final isFavorite = favoritesCubit.isProductFavorite(singlePost);
              if (isFavorite) {
                favoritesCubit.removeProduct(singlePost);
              } else {
                favoritesCubit.addProduct(singlePost);
              }
            },
            icon: Icon(
              favoritesCubit.isProductFavorite(singlePost)
                  ? Icons.favorite
                  : Icons.favorite_outline,
              color: darkPink,
            ),
          ),
        ],
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
