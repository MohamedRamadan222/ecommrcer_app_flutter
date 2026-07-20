import 'package:ecommerce_app/core/storage/secure_hive_helper.dart';
import 'package:ecommerce_app/data/login/models/user_model.dart';
import 'package:hive/hive.dart';

import '../../data/login/models/user_model.dart';

class UserStorage {
  UserStorage._();

  static const String _userKey = 'currentUser';

  static Box<UserModel> get _box =>
      Hive.box<UserModel>(SecureHiveHelper.userBoxName);

  static Future<void> saveUser(UserModel user) async {
    await _box.put(_userKey, user);
  }

  static UserModel? getUser() {
    return _box.get(_userKey);
  }

  static String? getToken() {
    return getUser()?.token;
  }

  static Future<void> clearUser() async {
    await _box.delete(_userKey);
  }

  static bool get isLoggedIn => getUser() != null;
}
