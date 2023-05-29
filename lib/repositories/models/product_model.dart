// import 'package:fhome/repositories/models/category_model.dart';

class Product {
  final int id;
  final int price;
  final String title;
  final String description;
  // final CategoryModel category;
  final String photo;
  // final int review;

  Product({
    required this.id,
    required this.title,
    required this.description,
    // required this.category,
    required this.photo,
    required this.price,
    // required this.review,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      // category: CategoryModel.fromJson(map['category']),
      photo: map['photo'] as String,
      price: map['price'] as int,
      // review: map['review'] as int,
    );
  }

  // Model for details
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      // category: CategoryModel.fromJson(json['category']),
      photo: json['photo'] as String,
      price: json['price'] as int,
      // review: json['review'] as int,
    );
  }
}
