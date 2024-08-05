import 'package:test_app/features/product/data/repositories/product_repository.dart';

import '../entities/product.dart';


class FilterProducts {
  final ProductRepository repository;

  FilterProducts(this.repository);

  Future<List<Product>> call(String category) async {
    return await repository.filterProducts(category);
  }
}
