import 'package:fhome/components/constants.dart';
import 'package:fhome/components/size_config.dart';
import 'package:fhome/features/screens/home/components/categories/categories_details.dart';
import 'package:fhome/repositories/models/category_model.dart';
import 'package:fhome/service/category_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<Map<String, dynamic>> categoryImages = [
    {"icon": "assets/icons/bun.svg", "text": "Булочки"},
    {"icon": "assets/icons/cake.svg", "text": "Торты"},
    {"icon": "assets/icons/bisquit.svg", "text": "Пирожные"},
    {"icon": "assets/icons/cupcake.svg", "text": "Капкейки"},
    {"icon": "assets/icons/pie.svg", "text": "Пироги"},
    {"icon": "assets/icons/cookie.svg", "text": "Печенье"},
    {"icon": "assets/icons/food.svg", "text": "Пончики"},
    {"icon": "assets/icons/macaron.svg", "text": "Макаронсы"},
  ];

  List<CategoryModel> categories = [];

  @override
  void initState() {
    super.initState();
    fetchCategories(); // Стягивание из апишки
  }

  void fetchCategories() async {
    try {
      CategoryService categoryService = CategoryService();
      List<CategoryModel> fetchedCategories =
          await categoryService.fetchCategories();
      setState(() {
        categories = fetchedCategories;
      });
    } catch (e) {
      // Обработка ошибки
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            categories.length,
            (index) => CategoryCard(
              icon: categoryImages[index][
                  "icon"], // Если Дастанчик добавит фотки в категории, можно будет стянуть их здесь
              text: categories[index].categoryName,
              press: () {},
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, CategoriesDetails.routeName);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: SizedBox(
          width: getProportionateScreenWidth(55),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                height: getProportionateScreenWidth(55),
                width: getProportionateScreenWidth(100),
                decoration: BoxDecoration(
                  color: lightPink.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(icon!),
              ),
              const SizedBox(height: 5),
              Text(
                text!,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );
  }
}
