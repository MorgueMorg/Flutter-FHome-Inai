import 'package:fhome/repositories/models/product_model.dart';
import 'package:fhome/service/api_service.dart';

class ProductRepository {
  final ApiService apiService;

  ProductRepository({required this.apiService});

  Future<List<Product>?> getProductList() async {
    final response = await apiService.getProductData();
    if (response != null) {
      final data = response.data as List<dynamic>;
      return data
          .map(
            (singleProduct) => Product.fromMap(singleProduct),
          )
          .toList();
    }
    return null;
  }
}
