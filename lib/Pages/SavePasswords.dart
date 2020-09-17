import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:encryptor/db/DBhelper.dart';
import 'package:sqflite/sqflite.dart';

class SavePasswords extends StatefulWidget {
  @override
  _SavePasswordsState createState() => _SavePasswordsState();
}

class _SavePasswordsState extends State<SavePasswords> {
  /**
   * Global Key for the form state
   */

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final dbhelper = Databasehelper.instance;

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

  // Password Validator
  final _passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(8, errorText: 'passwords must be atleast 8')
  ]);

  void insert() async {
    Navigator.pop(context);
    Map<String, dynamic> row = {
      Databasehelper.platformColumn: _value,
      Databasehelper.usernameColumn: _usernameController.text,
      Databasehelper.emailColumn: _emailController.text,
      Databasehelper.passwordColumn: _passwordController.text,
    };

    final id = await dbhelper.insert(row);
    print(id);
  }

  void showAll() async {
    final res = await dbhelper.query_all();
    print(res);
  }

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
                      validator:
                          RequiredValidator(errorText: 'username is required'),
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
                      validator: _passwordValidator,
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
                    onPressed: insert,
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
