import 'dart:math';
import 'package:random_string/random_string.dart';
import 'package:crypto/crypto.dart';

class PasswordGenerator {
  static String generate(int length) {
    String generated = randomAlphaNumeric(length);
    return generated;
  }

  static String md5_encrypt(String str) {
    String md5_hashCode;

    return md5_hashCode;
  }

  static String sha256_encrypt(String str) {
    String sha256_hashCode;

    return sha256_hashCode;
  }
}
