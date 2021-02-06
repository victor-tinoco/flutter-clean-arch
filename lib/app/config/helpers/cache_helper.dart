import 'package:shared_preferences/shared_preferences.dart';
import 'package:squadmobile_base_project/app/config/helpers/encrypt_helper.dart';
import 'package:uuid/uuid.dart';

abstract class CacheHelper {
  Future<String> get(String key);
  Future set(String key, String value);
  Future<void> remove(String key);
}

class CacheHelperImpl implements CacheHelper {
  final Uuid _uuid;
  final EncryptHelper _encryptHelper;
  Future<SharedPreferences> _getInstance() => SharedPreferences.getInstance();

  CacheHelperImpl(this._uuid, this._encryptHelper);

  Future<String> get(String key) async {
    final cache = await _getInstance();
    final String value = cache.getString(key);
    final uuid = _uuid.v4();
    final decryptedValue = _encryptHelper.decrypt(value, uuid);

    return decryptedValue;
  }

  Future set(String key, String value) async {
    final cache = await _getInstance();
    final uuid = _uuid.v4();
    final encryptedValue = _encryptHelper.encrypt(value, uuid);
    cache.setString(key, encryptedValue);
  }

  Future<void> remove(String key) async {
    final cache = await _getInstance();
    cache.remove(key);
  }
}
