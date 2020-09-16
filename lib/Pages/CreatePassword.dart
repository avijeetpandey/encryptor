import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreatePassword extends StatefulWidget {
  @override
  _CreatePasswordState createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  // Text Editing Controller for the Encryption Field
  TextEditingController _textController = TextEditingController();
  String _encryptedPassword = 'This is the encrypted Text';

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /**
     * Encryption Related UI stuff
     * Contains md5 and sha256 algorithms for encryption
     */

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.message),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _textController.clear();
                  },
                ),
                hintText: "Enter here for encryption",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
                labelText: 'Encrypt password',
              ),
              maxLength: 30,
              autocorrect: false,
              autofocus: false,
            ),
          ),

          /**
           * Radio Buttons for selecting the Algorithm weather md5 or SHA256
           */

          /**
           * Encrypted Password Text Field
           */

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              _encryptedPassword,
              textAlign: TextAlign.center,
              style: GoogleFonts.acme(
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 10),

          /**
           * Raised Button for Generating Simple Alphanumeric Password
           */
          RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            color: Colors.orange[800],
            onPressed: () {
              print('Controller Text : '+_textController.text);
            },
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Generate Password",
                style: GoogleFonts.acme(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
