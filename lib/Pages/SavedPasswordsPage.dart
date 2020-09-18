import 'package:flutter/material.dart';
import '../utils/ListPasswordView.dart';

class SavedPassword extends StatefulWidget {
  @override
  _SavedPasswordState createState() => _SavedPasswordState();
}

class _SavedPasswordState extends State<SavedPassword> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListPasswordView(),
    );
  }
}
