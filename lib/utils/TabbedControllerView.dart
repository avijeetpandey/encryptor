import 'package:encryptor/utils/TabbedView.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabbedControllerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Encryptor",
            style: GoogleFonts.acme(fontSize: 28),
          ),
          bottom: TabBar(
            tabs: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(Icons.vpn_key),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(Icons.assignment_turned_in),
              )
            ],
          ),
          centerTitle: true,
        ),
        body: TabbedView()
        )
    );
  }
}