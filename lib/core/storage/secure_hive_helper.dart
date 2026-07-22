import 'dart:convert';

import 'package:ecommerce_app/data/login/models/user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';


class SecureHiveHelper {
  SecureHiveHelper._();

  static const _secureStorage = FlutterSecureStorage();
  static const _encryptionKeyName = 'hive_encryption_key';
  static const String userBoxName = 'userBox';

  static Future<List<int>> _getEncryptionKey() async {
    String? encodedKey = await _secureStorage.read(key: _encryptionKeyName);

    if (encodedKey == null) {
      final key = Hive.generateSecureKey();
      await _secureStorage.write(
        key: _encryptionKeyName,
        value: base64Encode(key),
      );
      return key;
    }
    return base64Url.decode(encodedKey);
  }

  static Future<Box<UserModel>> openUserBox() async {
    final key = await _getEncryptionKey();
    return await Hive.openBox<UserModel>(
      userBoxName,
      encryptionCipher: HiveAesCipher(key),
    );
  }
}
