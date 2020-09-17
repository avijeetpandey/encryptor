import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SavePasswords extends StatefulWidget {
  @override
  _SavePasswordsState createState() => _SavePasswordsState();
}

class _SavePasswordsState extends State<SavePasswords> {
  /**
   * Global Key for the form state
   */

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  /**
   * Text Editing Controllers
   */

  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  /** DropDown list value */
  String _value = 'Facebook';

  /**
   * Popular Platforms List
   */

  List<String> platforms = <String>[
    'Facebook',
    'LinkedIn',
    'Instagram',
    'SnapChat',
    'Quora',
    'Twitter',
    'Others'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Save Passwords",
          style: GoogleFonts.acme(fontSize: 24),
        ),
        centerTitle: true,
        toolbarHeight: 60.0,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
              key: formkey,
              child: Column(
                children: [
                  /**
                   * DropDown List for platform selection
                   */

                  DropdownButton(
                    autofocus: true,
                    value: _value,
                    items: platforms.map((String platform) {
                      return DropdownMenuItem(
                        value: platform,
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            platform,
                            style: GoogleFonts.acme(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    },
                  ),

                  /**
                   * Email Text Form field
                   */
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      autofocus: true,
                      controller: _emailController,
                      autocorrect: false,
                      autovalidate: true,
                      validator: EmailValidator(errorText: "Not a valid Email"),
                      decoration: InputDecoration(
                          labelText: "Email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18)),
                          prefixIcon: Icon(Icons.email),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () {
                              _emailController.clear();
                            },
                          )),
                    ),
                  ),

                  /**
                 * Username text form field
                 */
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      controller: _usernameController,
                      autocorrect: false,
                      decoration: InputDecoration(
                          labelText: "Username",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18)),
                          prefixIcon: Icon(Icons.account_circle),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () {
                              _usernameController.clear();
                            },
                          )),
                    ),
                  ),

                  /**
                 * Password Text Form Field
                 */

                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      obscureText: true,
                      controller: _passwordController,
                      autocorrect: false,
                      decoration: InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18)),
                          prefixIcon: Icon(Icons.vpn_key),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () {
                              _passwordController.clear();
                            },
                          )),
                    ),
                  ),

                  /**
                   * Raised Button for saving the passwords
                   */
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    color: Colors.orange[800],
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Text("Save",
                          style: GoogleFonts.acme(
                              color: Colors.white, fontSize: 18)),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
