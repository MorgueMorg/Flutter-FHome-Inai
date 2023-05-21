import 'package:fhome/features/cubit/product_fetch_cubit.dart';
import 'package:fhome/features/screens/home/components/carousel.dart';
import 'package:fhome/features/screens/home/components/home_header.dart';
import 'package:fhome/repositories/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const HomeHeader(),
          const SizedBox(height: 20),
          const Carousel(),
          const SizedBox(height: 20),
          BlocBuilder<ProductFetchCubit, ProductFetchState>(
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
                              ListTile(
                                leading: Image.network(singlePost.photo),
                                title: Text(singlePost.title),
                                subtitle: Text(singlePost.description),
                              ),
                            ],
                          );
                        },
                      );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
