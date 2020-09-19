import 'package:flutter/material.dart';
import 'package:encryptor/db/DBhelper.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/NoPasswordView.dart';

class ListPasswordView extends StatefulWidget {
  @override
  _ListPasswordViewState createState() => _ListPasswordViewState();
}

class _ListPasswordViewState extends State<ListPasswordView> {
  final dbhelper = Databasehelper.instance;
  List<Map<String, dynamic>> _records;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     getAllData();
  }

  void _showToast(BuildContext context) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(SnackBar(
      content: Text("Copied"),
      duration: Duration(microseconds: 150),
    ));
  }

  Future<void> getAllData() async {
    var res = await dbhelper.query_all();
    setState(() {
      _records = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: _records == null
            ? NoPasswordView()
            : ListView.builder(
                itemCount: _records.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                      child: ListTile(
                    leading: CircleAvatar(child: Image.asset((() {
                      if (_records[index]['platform'] == 'Facebook')
                        return 'assets/icons/facebook.png';
                      else if (_records[index]['platform'] == 'LinkedIn')
                        return 'assets/icons/linkedin.png';
                      else if (_records[index]['platform'] == 'SnapChat')
                        return 'assets/icons/snapchat.png';
                      else if (_records[index]['platform'] == 'Twitter')
                        return 'assets/icons/twitter.png';
                      else if (_records[index]['platform'] == 'Quora')
                        return 'assets/icons/quora.png';
                      else if (_records[index]['platform'] == 'Instagram')
                        return 'assets/icons/instagram.png';
                      else
                        return 'assets/icons/other.png';
                    })())),
                    title: Text(
                      _records[index]["username"],
                      style: GoogleFonts.acme(fontSize: 18),
                    ),
                    subtitle: Text(
                      _records[index]["password"],
                      style: GoogleFonts.acme(fontSize: 12),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.content_copy),

                      onPressed: () {
                        _showToast(context);
                        Clipboard.setData(
                            ClipboardData(text: _records[index]["password"]));
                      },
                    ),
                  ));
                },
              ));
  }
}
