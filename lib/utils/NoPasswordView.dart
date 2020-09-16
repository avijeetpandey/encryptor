import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoPasswordView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Image.asset('assets/images/four.png'),
      SizedBox(height: 15.0),
      Text(
        "Saved passwords will be visible here",
        style: GoogleFonts.rancho(
          fontSize: 28.0,
          color: Colors.deepOrange,
        ),
      )
    ]);
  }
}
