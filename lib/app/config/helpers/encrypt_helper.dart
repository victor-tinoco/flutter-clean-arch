import 'package:encrypt/encrypt.dart';

abstract class EncryptHelper {
  String encrypt(String plainText, String key, {int roundsNumber});
  String decrypt(String encryptedText, String key, {int roundsNumber});
}

class EncryptHelperImpl implements EncryptHelper {
  static const int _DEFAULT_IV = 16;

  @override
  String encrypt(
    String plainText,
    String key, {
    int roundsNumber = _DEFAULT_IV,
  }) {
    final encrypter = _getEncrypter(key);
    final encrypted =
        encrypter.encrypt(plainText, iv: IV.fromLength(roundsNumber));
    return encrypted.base64;
  }

  @override
  String decrypt(
    String encryptedText,
    String key, {
    int roundsNumber = _DEFAULT_IV,
  }) {
    final encrypter = _getEncrypter(key);

    final decrypted = encrypter.decrypt(
      Encrypted.fromBase64(encryptedText),
      iv: IV.fromLength(roundsNumber),
    );

    return decrypted;
  }

  Encrypter _getEncrypter(String key) {
    final aes = AES(Key.fromUtf8(key));
    final encrypter = Encrypter(aes);
    return encrypter;
  }
}
