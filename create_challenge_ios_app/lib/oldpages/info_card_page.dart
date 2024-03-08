import 'package:flutter/material.dart';
import 'package:create_challenge_ios_app/globals.dart' as globals;

class InfoCardPage extends StatelessWidget {
  const InfoCardPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: globals.getBackgroundColor,
        appBar: AppBar(
          title: Text(
            "Info Card",
            style: TextStyle(
              color: globals.getTextColor,
              fontSize: 25,
              // fontWeight: FontWeight.bold,
            )),
          backgroundColor: globals.getRibbonColor,
          elevation: 0,
          // leading: Icon(Icons.menu),
          leading: IconButton(
              iconSize: 50,
              color: globals.getTextColor,
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