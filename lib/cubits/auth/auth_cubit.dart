import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/storage/user_storage.dart';
import 'package:ecommerce_app/cubits/auth/auth_state.dart';
import 'package:ecommerce_app/data/login/repositories/auth_repository.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository repository;

  AuthCubit(this.repository) : super(AuthState.initial());

  Future<void> login({
    required String username,
    required String password,
  }) async {
    emit(state.copyWith(status: AuthStatus.loading));

    try {
      final user = await repository.login(
        username: username,
        password: password,
      );
      await UserStorage.saveUser(user);
      emit(state.copyWith(status: AuthStatus.success));
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        emit(
          state.copyWith(
            status: AuthStatus.error,
            errMsg: 'اسم المستخدم أو كلمة المرور غير صحيحة',
          ),
        );
      } else if (e.type == DioExceptionType.connectionError) {
        emit(
          state.copyWith(
            status: AuthStatus.error,
            errMsg: 'تأكد من اتصالك بالإنترنت',
          ),
        );
      } else if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        emit(
          state.copyWith(
            status: AuthStatus.error,
            errMsg: 'انتهت مهلة الاتصال بالخادم',
          ),
        );
      } else {
        emit(
          state.copyWith(status: AuthStatus.error, errMsg: 'حدث خطأ غير متوقع'),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(status: AuthStatus.error, errMsg: 'حدث خطأ غير متوقع'),
      );
    }
  }

  Future<void> logout() async {
    await UserStorage.clearUser();
    emit(AuthState.initial());
  }
}
