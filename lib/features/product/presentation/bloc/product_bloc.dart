import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_products.dart';
import '../../domain/usecases/search_products.dart';
import '../../domain/usecases/filter_products.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProducts getProducts;
  final SearchProducts searchProducts;
  final FilterProducts filterProducts;

  ProductBloc({
    required this.getProducts,
    required this.searchProducts,
    required this.filterProducts,
  }) : super(ProductInitial()) {
    on<LoadProductsEvent>((event, emit) async {
      emit(ProductLoading());
      try {
        final products = await getProducts();
        emit(ProductLoaded(products));
      } catch (error) {
        emit(ProductError(error.toString()));
      }
    });

    on<SearchProductsEvent>((event, emit) async {
      emit(ProductLoading());
      try {
        final products = await searchProducts(event.query);
        emit(ProductLoaded(products));
      } catch (error) {
        emit(ProductError(error.toString()));
      }
    });

    on<FilterProductsEvent>((event, emit) async {
      emit(ProductLoading());
      try {
        final products = await filterProducts(event.category);
        emit(ProductLoaded(products));
      } catch (error) {
        emit(ProductError(error.toString()));
      }
    });
  }
}
