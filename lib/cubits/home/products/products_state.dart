import 'package:ecommerce_app/data/home/models/product_model.dart';

enum ProductsStatus { initial, loading, success, error }

const _sentinel = Object();

class ProductsState {
  final ProductsStatus status;
  final String? errMsg;
  final List<ProductModel>? products;

  ProductsState({required this.status, this.errMsg, this.products});

  factory ProductsState.initial() {
    return ProductsState(status: ProductsStatus.initial);
  }

  ProductsState copyWith({
    ProductsStatus? status,
    Object? errMsg = _sentinel,
    Object? products = _sentinel,
  }) {
    return ProductsState(
      status: status ?? this.status,
      errMsg: errMsg == _sentinel ? this.errMsg : errMsg as String?,
      products: products == _sentinel
          ? this.products
          : products as List<ProductModel>?,
    );
  }
}
