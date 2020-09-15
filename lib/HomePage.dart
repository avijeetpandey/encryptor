import 'package:encryptor/Pages/Onboarding.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Encryptor")
      ),
      body:OnBoarding()
    );
  }
}
