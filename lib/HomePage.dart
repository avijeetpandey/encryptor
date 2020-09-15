import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Encryptor"),
      ),
      body: Center(
        child: Text("This is a great App Made from Flutter"),
      ),
    );
  }
}
