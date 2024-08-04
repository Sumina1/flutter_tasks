abstract class ProductEvent {}

class LoadProductsEvent extends ProductEvent {}

class SearchProductsEvent extends ProductEvent {
  final String query;

  SearchProductsEvent(this.query);
}

class FilterProductsEvent extends ProductEvent {
  final String category;

  FilterProductsEvent(this.category);
}
