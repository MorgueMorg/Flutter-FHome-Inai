import 'package:fhome/components/size_config.dart';
import 'package:fhome/features/cubit/productFeature/product_fetch_cubit.dart';
import 'package:fhome/features/screens/home/components/products/custom_list_tile.dart';
import 'package:fhome/repositories/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchBlocProducts extends StatelessWidget {
  final String searchQuery;

  const FetchBlocProducts({
    Key? key,
    required this.searchQuery,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductFetchCubit, ProductFetchState>(
      builder: (context, state) {
        if (state is ProductFetchLoading) {
          return const Text("Ожидание продуктов...");
        } else if (state is ProductFetchError) {
          return Text(state.failure.message);
        } else if (state is ProductFetchLoaded) {
          final postList = state.productList;

          // ? Фильтрация списка продуктов с учетом поискового запроса
          final filteredList = postList.where((product) {
            final title = product.title.toLowerCase();
            final description = product.description.toLowerCase();
            final query = searchQuery.toLowerCase();
            return title.contains(query) || description.contains(query);
          }).toList();

          return filteredList.isEmpty
              ? const Text(
                  'Извините, \nв данный момент продуктов нет.',
                  textAlign: TextAlign.center,
                )
              : ListView.builder(
                  // ? physics - отключает прокрутку дочернего листвью, чтобы прокручился только основной синглскролл вью, чтобы не было отдельной прокрутки на одном экранеч
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(10),
                  itemCount: postList.length,
                  itemBuilder: (context, index) {
                    final Product singlePost = postList[index];
                    return Column(
                      children: [
                        SizedBox(height: getProportionateScreenHeight(20)),
                        CustomListTile(singlePost: singlePost),
                      ],
                    );
                  },
                );
        }
        return const SizedBox.shrink();
      },
    );
  }
}