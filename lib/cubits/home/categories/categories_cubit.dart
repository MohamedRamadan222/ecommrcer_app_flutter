import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/cubits/home/categories/categories_state.dart';
import 'package:ecommerce_app/data/categories/models/categories_model.dart';
import 'package:ecommerce_app/data/categories/repositories/category_repository.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoryRepository repository;

  CategoriesCubit(this.repository) : super(CategoriesState.initial());

  Future<void> getCategories() async {
    emit(state.copyWith(status: CategoriesStatus.loading));
    try {
      final List<CategoriesModel> categories = await repository.getCategories();

      emit(
        state.copyWith(
          status: CategoriesStatus.success,
          category: categories,
          errMsg: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: CategoriesStatus.error,
          errMsg: 'حدث خطأ غير متوقع',
        ),
      );
    }
  }
}
