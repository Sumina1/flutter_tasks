import '../entities/product.dart';
import '../repositories/product_repository.dart';

class FilterProducts {
  final ProductRepository repository;

  FilterProducts(this.repository);

  Future<List<Product>> call(String category) async {
    return await repository.filterProducts(category);
  }
}
