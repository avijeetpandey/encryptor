import 'package:encryptor/Pages/Onboarding.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Encryptor",
            style: GoogleFonts.acme(
              fontSize: 28
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Text("This is the home Page"),
        ));
  }
}
