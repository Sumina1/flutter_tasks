import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/features/product/domain/usecases/get_products.dart';
import 'package:test_app/features/product/domain/usecases/search_products.dart';
import 'package:test_app/features/product/domain/usecases/filter_products.dart';
import 'package:test_app/features/product/presentation/bloc/product_event.dart';
import 'package:test_app/features/product/presentation/bloc/product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProducts getProducts;
  final SearchProducts searchProducts;
  final FilterProducts filterProducts;

  List<String> selectedCategories = [];

  ProductBloc({
    required this.getProducts,
    required this.searchProducts,
    required this.filterProducts,
  }) : super(ProductInitial());

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is LoadProductsEvent) {
      yield ProductLoading();
      final failureOrProducts = await getProducts();
      yield* failureOrProducts.fold(
        (failure) async* {
          yield ProductError(message: _mapFailureToMessage(failure));
        },
        (products) async* {
          yield ProductLoaded(products: products);
        },
      );
    } else if (event is SearchProductsEvent) {
      yield ProductLoading();
      final failureOrProducts = await searchProducts(event.query);
      yield* failureOrProducts.fold(
        (failure) async* {
          yield ProductError(message: _mapFailureToMessage(failure));
        },
        (products) async* {
          yield ProductLoaded(products: products);
        },
      );
    } else if (event is FilterProductsEvent) {
      selectedCategories.add(event.category);
      yield ProductLoading();
      final failureOrProducts = await filterProducts(selectedCategories.join(","));
      yield* failureOrProducts.fold(
        (failure) async* {
          yield ProductError(message: _mapFailureToMessage(failure));
        },
        (products) async* {
          yield ProductLoaded(products: products);
        },
      );
    } else if (event is RemoveCategoryFilterEvent) {
      selectedCategories.remove(event.category);
      yield ProductLoading();
      final failureOrProducts = await filterProducts(selectedCategories.join(","));
      yield* failureOrProducts.fold(
        (failure) async* {
          yield ProductError(message: _mapFailureToMessage(failure));
        },
        (products) async* {
          yield ProductLoaded(products: products);
        },
      );
    }
  }

  String _mapFailureToMessage(Failure failure) {
    // Customize error handling based on failure types
    return 'An error occurred';
  }
}
