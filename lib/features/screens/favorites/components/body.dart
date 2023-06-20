import 'package:fhome/features/screens/home/components/products/custom_list_tile.dart';
import 'package:fhome/repositories/models/product_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fhome/features/cubit/favoritesFeature/favorites_cubit.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, List<Product>>(
      builder: (context, state) {
        return state.isEmpty
            ? const Center(
                child: Text("You have not added anything to favorites"),
              )
            : ListView.builder(
                itemCount: state.length,
                itemBuilder: (context, index) {
                  final product = state[index];
                  return CustomListTile(singlePost: product);
                },
              );
      },
    );
  }
}
