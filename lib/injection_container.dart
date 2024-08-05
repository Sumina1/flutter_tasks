import 'package:get_it/get_it.dart';

import 'package:test_app/features/product/data/repositories/product_repository.dart';
import 'package:test_app/helper/size_config.dart';
import 'features/product/data/datasources/product_remote_data_source.dart';
import 'features/product/data/repositories/product_repository_impl.dart';

import 'features/product/domain/usecases/get_products.dart';
import 'features/product/domain/usecases/search_products.dart';
import 'features/product/domain/usecases/filter_products.dart';
import 'features/product/presentation/bloc/product_bloc.dart';
import 'mock_api.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // External
  sl.registerLazySingleton(() => dio);

  // Data sources
  sl.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(dio: sl()),
  );

  // Repository
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton(() => SizeConfig());

  // Use cases
  sl.registerLazySingleton(() => GetProducts(sl()));
  sl.registerLazySingleton(() => SearchProducts(sl()));
  sl.registerLazySingleton(() => FilterProducts(sl()));

  // Bloc
  sl.registerFactory(() => ProductBloc(
    getProducts: sl(),
    searchProducts: sl(),
    filterProducts: sl(),
  ));
}
