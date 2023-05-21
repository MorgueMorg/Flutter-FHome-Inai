import 'package:flutter/material.dart';

List<String> images = [
  "assets/images/cupcake.jpeg",
  "assets/images/pink_rose_cake.jpeg",
  "assets/images/bisquit.webp",
  "assets/images/pink_cake.jpeg",
  "assets/images/slice_cake.jpeg",
  "assets/images/bakery.jpg",
];

class Carousel extends StatelessWidget {
  const Carousel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: PageView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          height: 150,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              images[index],
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
