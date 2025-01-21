import 'package:elm_task/src/data/sources/local/secure_storage/authentication_secure_storage.dart';
import 'package:elm_task/src/data/sources/local/shared_preferences_keys.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthenticationSecureStorageImpl implements AuthenticationSecureStorage {
  final FlutterSecureStorage _secureStorage;

  AuthenticationSecureStorageImpl(this._secureStorage);

  @override
  Future<void> saveToken(String token) async {
    await _secureStorage.write(
      key: SharedPreferenceKeys.token,
      value: token,
    );
  }

  @override
  Future<String> getToken() async {
    return await _secureStorage.read(key: SharedPreferenceKeys.token) ?? "";
  }

  @override
  Future<void> deleteToken() async {
    return _secureStorage.delete(key: SharedPreferenceKeys.token);
  }
}
