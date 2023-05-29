// ! Моделька чтобы потом еще можно было смотреть товар по категории
class CategoryModel {
  final int id;
  final String categoryName;
  final String status;

  CategoryModel(
      {required this.id, required this.categoryName, required this.status});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      categoryName: json['categoryName'],
      status: json['status'],
    );
  }
}
