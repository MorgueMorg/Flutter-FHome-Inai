class Product {
  final int id;
  final String title;
  final String description;

  Product({required this.id, required this.title, required this.description});

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
    );
  }
}
