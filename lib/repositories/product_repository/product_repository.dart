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

  Future<List<Product>?> searchProducts(String query) async {
    final List<Product>? productList = await getProductList();
    if (productList != null) {
      if (query.isEmpty) {
        return productList;
      } else {
        final List<Product> searchResult = productList.where((product) {
          // ! Поиск продуктов по названию и описанию на локалке (из уже стянутых продуктов), потому что нет живого поиска на бэкенде.
          final String productTitle = product.title.toLowerCase();
          final String productDescription = product.description.toLowerCase();
          final String searchQuery = query.toLowerCase();
          return productTitle.contains(searchQuery) ||
              productDescription.contains(searchQuery);
        }).toList();
        return searchResult;
      }
    }
    return null;
  }
}
