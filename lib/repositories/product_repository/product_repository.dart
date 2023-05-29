import 'package:fhome/repositories/models/product_model.dart';
import 'package:fhome/service/product_service.dart';

class ProductRepository {
  final ProductService productService;

  ProductRepository({required this.productService});

  Future<List<Product>?> getProductList() async {
    final response = await productService.getProductData();
    if (response != null) {
      final List<dynamic> data = response.data['products'];
      final List<Product> productList =
          data.map((singleProduct) => Product.fromMap(singleProduct)).toList();
      return productList;
    }
    return null;
  }
}
