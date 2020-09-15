import 'package:encryptor/Pages/CreatePassword.dart';
import 'package:encryptor/Pages/SavedPasswordsPage.dart';
import 'package:flutter/material.dart';

class TabbedView extends StatefulWidget {
  @override
  _TabbedViewState createState() => _TabbedViewState();
}

class _TabbedViewState extends State<TabbedView> {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        CreatePassword(),
        SavedPassword()
      ],
    );
  }
}
