import 'package:test_app/features/product/data/repositories/product_repository.dart';

import '../entities/product.dart';


class GetProducts {
  final ProductRepository repository;

  GetProducts(this.repository);

  Future<List<Product>> call() async {
    return await repository.getProducts();
  }
}
