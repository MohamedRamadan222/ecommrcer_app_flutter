import 'package:ecommerce_app/data/login/datasources/auth_remote_data_source.dart';

import '../models/user_model.dart';

class AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepository(this.remoteDataSource);

  Future<UserModel> login({
    required String username,
    required String password,
  }) async {
    return remoteDataSource.login(username: username, password: password);
  }
}
