import 'package:ecommerce_app/data/categories/models/categories_model.dart';

enum CategoriesStatus { initial, loading, success, error }

const _sentinel = Object();

class CategoriesState {
  final CategoriesStatus status;
  final String? errMsg;
  final List<CategoriesModel>? category;

  CategoriesState({required this.status, this.errMsg, this.category});

  factory CategoriesState.initial() {
    return CategoriesState(status: CategoriesStatus.initial);
  }

  CategoriesState copyWith({
    CategoriesStatus? status,
    Object? errMsg = _sentinel,
    Object? category = _sentinel,
  }) {
    return CategoriesState(
      status: status ?? this.status,
      errMsg: errMsg == _sentinel ? this.errMsg : this.errMsg,
      category: category == _sentinel
          ? this.category
          : category as List<CategoriesModel>?,
    );
  }
}
