import 'package:fhome/components/constants.dart';
import 'package:fhome/components/size_config.dart';
import 'package:fhome/features/cubit/productFeature/product_fetch_cubit.dart';
import 'package:fhome/features/screens/home/components/carousel.dart';
import 'package:fhome/features/screens/home/components/categoires.dart';
import 'package:fhome/features/screens/home/components/custom_list_tile.dart';
import 'package:fhome/features/screens/home/components/home_header.dart';
import 'package:fhome/repositories/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late ProductFetchCubit productFetchCubit;

  @override
  void initState() {
    super.initState();
    productFetchCubit = context.read<ProductFetchCubit>();
  }

  Future<void> _refreshData() async {
    productFetchCubit.fetchProductApi();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: darkPink,
      onRefresh: _refreshData,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenWidth(15)),
              const HomeHeader(),
              SizedBox(height: getProportionateScreenWidth(30)),
              const Carousel(),
              SizedBox(height: getProportionateScreenWidth(20)),
              const Categories(),
              SizedBox(height: getProportionateScreenWidth(0)),
              const _FetchBlocProducts(),
            ],
          ),
        ),
      ),
    );
  }
}

class _FetchBlocProducts extends StatelessWidget {
  const _FetchBlocProducts();

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
          return postList.isEmpty
              ? const Text('No any posts')
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
