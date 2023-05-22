class Product {
  final int id;
  final int price;
  final String title;
  final String description;
  final String photo;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.photo,
      required this.price});

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      photo: map['photo'] as String,
      price: map['price'] as int,
    );
  }

  // Model for details
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      photo: json['photo'] as String,
      price: json['price'] as int,
    );
  }
}
