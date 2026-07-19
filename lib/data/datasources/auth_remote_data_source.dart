import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/network/dio_client.dart';
import 'package:ecommerce_app/data/models/user_model.dart';

class AuthRemoteDataSource {

  AuthRemoteDataSource();

  Future<UserModel> login({
    required String username,
    required String password,
  }) async {
    final response = await ApiClient.dio.post(
      '/auth/login',
      data: {'username': username, 'password': password},
    );
    return UserModel.fromJson(response.data);
  }
}
