import '../../domain/entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
  Future<List<Product>> searchProducts(String query);
  Future<List<Product>> filterProducts(String category);
}
