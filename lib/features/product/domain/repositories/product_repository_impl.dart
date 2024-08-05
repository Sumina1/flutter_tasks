import '../../data/datasources/product_remote_data_source.dart';
import '../../data/repositories/product_repository.dart';
import '../../domain/entities/product.dart';

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
    final productModels = await remoteDataSource.searchProducts(query);
    return productModels;
  }

  @override
  Future<List<Product>> filterProducts(String category) async {
    final productModels = await remoteDataSource.filterProducts(category);
    return productModels;
  }
}
