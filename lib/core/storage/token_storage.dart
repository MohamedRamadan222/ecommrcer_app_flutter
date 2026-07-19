// import 'package:hive_flutter/hive_flutter.dart';
//
// class TokenStorage {
//   TokenStorage._();
//
//   static const String _boxName = 'authBox';
//   static const String _tokenKey = 'token';
//
//   static Box get _box => Hive.box(_boxName);
//
//   static Future<void> saveToken(String token) async {
//     await _box.put(_tokenKey, token);
//   }
//
//   static String? getToken() {
//     return _box.get(_tokenKey);
//   }
//
//   static Future<void> deleteToken() async {
//     await _box.delete(_tokenKey);
//   }
//
//   static bool get hasToken => getToken() != null;
// }
// غير مستخدم