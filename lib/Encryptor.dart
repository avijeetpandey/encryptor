import 'package:encryptor/Pages/Onboarding.dart';
import 'package:flutter/material.dart';
import './HomePage.dart';

class Encryptor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Encryptor",
      debugShowCheckedModeBanner: false,
      home: OnBoarding(),
    );
  }
}
