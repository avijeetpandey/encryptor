import 'dart:convert';
import 'package:random_string/random_string.dart';
import 'package:crypto/crypto.dart';

/** 
 * 
 * Class to manage Password Generation based on various Algorithms
 * 
*/
class PasswordGenerator {
  static String _salt = "Axndfaslkhsdfjbsd;fjfdlkfsbfkjfga;fbafijbsfjf";
  static String generate(int length) {
    String generated = randomAlphaNumeric(length);
    return generated;
  }

/**
 * This function returns md5 algorithm based hashcode for encryption
 */
  static String md5_encrypt(String str) {
    String md5_hashCode;
    var key = utf8.encode(str);
    md5_hashCode = md5.convert(key).toString();
    return md5_hashCode;
  }

  /**
   * This function returns sha256 algorithm based hashcode for encryption
   */

  static String sha256_encrypt(String str) {
    String sha256_hashCode;
    var key = utf8.encode(str);
    var bytes = utf8.encode(_salt);
    var hmac256 = Hmac(sha256, key);
    var digest = hmac256.convert(bytes);
    sha256_hashCode = digest.toString();
    double len = sha256_hashCode.length / 2;
    sha256_hashCode = sha256_hashCode.substring(0, len.toInt());
    return sha256_hashCode;
  }
}
