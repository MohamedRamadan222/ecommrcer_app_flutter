import 'package:ecommerce_app/data/home/models/product_model.dart';

enum ProductsStatus { initial, loading, success, error }

const _sentinel = Object();

class ProductsState {
  final ProductsStatus status;
  final String? errMsg;
  final List<ProductModel>? products;
  final String? selectedCategory;
  final String? searchQuery;

  ProductsState({
    required this.status,
    this.errMsg,
    this.products,
    this.selectedCategory,
    this.searchQuery = '',
  });

  factory ProductsState.initial() {
    return ProductsState(status: ProductsStatus.initial);
  }

  List<ProductModel> get filteredProducts {
    final all = products ?? [];

    return all.where((product) {
      final matchCategory =
          selectedCategory == null || product.category == selectedCategory;

      final matchSearch = product.title.toLowerCase().contains(
        searchQuery!.toLowerCase(),
      );

      return matchCategory && matchSearch;
    }).toList();
  }

  ProductsState copyWith({
    ProductsStatus? status,
    Object? errMsg = _sentinel,
    Object? products = _sentinel,
    Object? selectedCategory = _sentinel,
    String? searchQuery,
  }) {
    return ProductsState(
      status: status ?? this.status,
      errMsg: errMsg == _sentinel ? this.errMsg : errMsg as String?,
      products: products == _sentinel
          ? this.products
          : products as List<ProductModel>?,
      selectedCategory: selectedCategory == _sentinel
          ? this.selectedCategory
          : selectedCategory as String?,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}
