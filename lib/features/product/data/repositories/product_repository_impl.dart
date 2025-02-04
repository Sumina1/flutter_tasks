import 'package:test_app/features/product/data/repositories/product_repository.dart';

import '../../domain/entities/product.dart';

import '../datasources/product_remote_data_source.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Product>> getProducts() async {
    final productModels = await remoteDataSource.getProducts();
    return productModels;
  }

@override
  Future<List<Product>> searchProducts(String query) async {
       final productModels = await remoteDataSource.getProducts();
    return productModels.where((product) => product.name.toLowerCase().contains(query.toLowerCase())).toList();
  }
  @override
  Future<List<Product>> filterProducts(String category) async {
    final productModels = await remoteDataSource.filterProducts(category);
    return productModels;
  }
}



