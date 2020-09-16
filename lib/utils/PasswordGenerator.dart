import 'dart:math';
import 'package:random_string/random_string.dart';

class PasswordGenerator {
  static String generate(int length) {
    String generated = randomAlphaNumeric(length);
    return generated;
  }
}
