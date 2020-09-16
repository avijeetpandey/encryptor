import 'package:encryptor/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './Encryptor.dart';
import 'package:flutter/services.dart';

Future main() async {
    WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);


  Constants.prefs = await SharedPreferences.getInstance();

  runApp(Encryptor());
}
