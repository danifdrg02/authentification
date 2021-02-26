import 'package:authentification/authentification.dart';
import 'package:authentification/authentification_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amber,
        child: Center(
          child: FlatButton(
            color: Colors.blueGrey,
            hoverColor: Colors.blueGrey[700],
            highlightColor: Colors.blueGrey[800],
            onPressed: () async {
              await signOut().then((result) {
                print(result);
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (context) => AuthPage(),
                  ),
                );
              }).catchError((error) {
                print('Sign Out Error: $error');
              });
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: 8.0,
                bottom: 8.0,
              ),
              child: Text(
                'deconnection',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
