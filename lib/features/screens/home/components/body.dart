import 'package:fhome/components/constants.dart';
import 'package:fhome/components/size_config.dart';
import 'package:fhome/features/cubit/product_fetch_cubit.dart';
import 'package:fhome/features/screens/home/components/carousel.dart';
import 'package:fhome/features/screens/home/components/categoires.dart';
import 'package:fhome/features/screens/home/components/home_header.dart';
import 'package:fhome/repositories/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
          return const CircularProgressIndicator();
        } else if (state is ProductFetchError) {
          return Text(state.failure.message);
        } else if (state is ProductFetchLoaded) {
          final postList = state.productList;
          return postList.isEmpty
              ? const Text('No any posts')
              : ListView.builder(
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
        singlePost.price.toString(),
        style: const TextStyle(
            color: darkPink, fontWeight: FontWeight.w700, fontSize: 16),
      ),
      title: Text(singlePost.title),
      subtitle: Text('${singlePost.description.substring(0, 28)}...'),
    );
  }
}
