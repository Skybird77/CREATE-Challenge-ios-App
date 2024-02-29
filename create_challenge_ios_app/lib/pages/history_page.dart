import 'package:flutter/material.dart';
import 'package:create_challenge_ios_app/globals.dart' as globals;

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: globals.backgroundColor,
        appBar: AppBar(
          title: Text(
            "History",
            style: TextStyle(
              color: globals.textColor,
              fontSize: 25,
              // fontWeight: FontWeight.bold,
            )),
          backgroundColor: globals.ribbonColor,
          elevation: 0,
          // leading: Icon(Icons.menu),
          leading: IconButton(
              iconSize: 50,
              color: globals.textColor,
              onPressed: () {
                 Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
              ),
            )
        ),
    );
  }
}