import 'package:ecommerce_app/data/home/models/product_model.dart';

enum ProductsStatus { initial, loading, success, error }

const _sentinel = Object();

class ProductsState {
  final ProductsStatus status;
  final String? errMsg;
  final List<ProductModel>? products;
  final String? selectedCategory;

  ProductsState({
    required this.status,
    this.errMsg,
    this.products,
    this.selectedCategory,
  });

  factory ProductsState.initial() {
    return ProductsState(status: ProductsStatus.initial);
  }

  List<ProductModel> get filteredProducts {
    final all = products ?? [];
    if (selectedCategory == null) {
      return all;
    }
    return all
        .where((product) => product.category == selectedCategory)
        .toList();
  }

  ProductsState copyWith({
    ProductsStatus? status,
    Object? errMsg = _sentinel,
    Object? products = _sentinel,
    Object? selectedCategory = _sentinel,
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
    );
  }
}
