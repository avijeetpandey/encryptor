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
                   * Email Text Form field
                   */
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      controller: _emailController,
                      autocorrect: false,
                      decoration: InputDecoration(
                          labelText: "Email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18)),
                          prefixIcon: Icon(Icons.email),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () {},
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
                            onPressed: () {},
                          )),
                    ),
                  ),

                /**
                 * Password Text Form Field
                 */
                
                Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      controller: _passwordController,
                      autocorrect: false,
                      decoration: InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18)),
                          prefixIcon: Icon(Icons.vpn_key),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () {},
                          )),
                    ),
                  )

                ],
              )),
        ),
      ),
    );
  }
}
