import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreatePassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
            color: Colors.orange[800],
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("Generate Password",
                style: GoogleFonts.acme(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
