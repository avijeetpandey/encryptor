import 'package:encryptor/Pages/Onboarding.dart';
import 'package:encryptor/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'Pages/HomePage.dart';
import 'Pages/SavePasswords.dart';

class Encryptor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: "Encryptor",
      debugShowCheckedModeBanner: false,
      home: Constants.prefs.getBool("isBoarded") == true
          ? HomePage()
          : OnBoarding(),
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      routes: {
        "/home": (context) => HomePage(),
        "/save": (context) => SavePasswords()
      },
    );
  }
}
