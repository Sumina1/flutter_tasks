import 'package:test_app/features/product/data/repositories/product_repository.dart';

import '../entities/product.dart';


class SearchProducts {
  final ProductRepository repository;

  SearchProducts(this.repository);

  Future<List<Product>> call(String query) async {
    return await repository.searchProducts(query);
  }
}


