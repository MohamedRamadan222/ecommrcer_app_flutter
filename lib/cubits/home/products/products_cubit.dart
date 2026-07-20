import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/cubits/home/products/products_state.dart';
import 'package:ecommerce_app/data/home/models/product_model.dart';
import 'package:ecommerce_app/data/home/repositories/products_repository.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepository repository;

  ProductsCubit(this.repository) : super(ProductsState.initial());

  Future<void> getProducts() async {
    emit(state.copyWith(status: ProductsStatus.loading));

    try {
      final List<ProductModel> products = await repository.getProducts();
      emit(
        state.copyWith(
          status: ProductsStatus.success,
          products: products,
          errMsg: null,
        ),
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        emit(
          state.copyWith(
            status: ProductsStatus.error,
            errMsg: 'حدث خطأ أثناء جلب المنتجات',
          ),
        );
      } else if (e.type == DioExceptionType.connectionError) {
        emit(
          state.copyWith(
            status: ProductsStatus.error,
            errMsg: 'تأكد من اتصالك بالإنترنت',
          ),
        );
      } else if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        emit(
          state.copyWith(
            status: ProductsStatus.error,
            errMsg: 'انتهت مهلة الاتصال بالخادم',
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: ProductsStatus.error,
            errMsg: 'حدث خطأ غير متوقع',
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: ProductsStatus.error,
          errMsg: 'حدث خطأ غير متوقع',
        ),
      );
    }
  }
}
