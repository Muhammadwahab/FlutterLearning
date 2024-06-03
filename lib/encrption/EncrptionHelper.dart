import 'package:encrypt/encrypt.dart' as encrypt;

class EncryptionHelper {
  // Generate a random 32 byte key

  static String encryptText(String text,String key) {
    var encrptKey=deriveKey(key, 32);

    var abc=encrypt.IV.fromLength(16);
    final encrypter = encrypt.Encrypter(encrypt.AES(encrptKey));
    final encrypted = encrypter.encrypt(text, iv: abc);
    return encrypted.base64;
  }

  static String decryptText(String encryptedText,String key) {
    var encrptKey=deriveKey(key, 32);
    var abc=encrypt.IV.fromLength(16);

    final encrypter = encrypt.Encrypter(encrypt.AES(encrptKey));
    final decrypted = encrypter.decrypt64(encryptedText, iv: abc);
    return decrypted;
  }
  static encrypt.Key deriveKey(String key, int keyLength) {
    if (key.length > keyLength) {
      // Truncate the key to the required length
      key = key.substring(0, keyLength);
    } else if (key.length < keyLength) {
      // Pad the key with spaces to the required length
      key = key.padRight(keyLength, ' ');
    }
    return encrypt.Key.fromUtf8(key);
  }
}