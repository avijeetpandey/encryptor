import 'package:flutter/services.dart';

import '../utils/PasswordGenerator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum Algorithms { sh256, md5 }

class CreatePassword extends StatefulWidget {
  @override
  _CreatePasswordState createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  // Text Editing Controller for the Encryption Field
  TextEditingController _textController = TextEditingController();
  String _encryptedPassword = 'This is the encrypted Text';
  String _tempString;
  Algorithms _algorithm = Algorithms.sh256;

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
          RadioListTile<Algorithms>(
            title: Text('SHA - 256'),
            value: Algorithms.sh256,
            groupValue: _algorithm,
            onChanged: (Algorithms value) {
              setState(() {
                _algorithm = value;
              });
            },
          ),
          RadioListTile<Algorithms>(
            title: Text('MD - 5 '),
            value: Algorithms.md5,
            groupValue: _algorithm,
            onChanged: (Algorithms value) {
              setState(() {
                _algorithm = value;
              });
            },
          ),

          /**
           * Encrypted Password Text Field
           */

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SelectableText(
                  _encryptedPassword,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.acme(
                    fontSize: 18.5,
                  ),
                ),
              ),

              /**
               * Action Button to make text copiable to the clip board
               */

              IconButton(
                icon: Icon(Icons.content_copy),
                iconSize: 25.0,
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: _encryptedPassword));
                },
              )
            ],
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
              setState(() {
                _tempString = _textController.text;
                _textController.clear();
                _encryptedPassword = _algorithm == Algorithms.md5
                    ? PasswordGenerator.md5_encrypt(_tempString)
                    : PasswordGenerator.sha256_encrypt(_tempString);
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text("Encrypt Text",
                  style: GoogleFonts.acme(color: Colors.white, fontSize: 18)),
            ),
          ),
        ],
      ),
    ));
  }
}
