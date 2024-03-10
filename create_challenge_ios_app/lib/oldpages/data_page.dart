import 'package:flutter/material.dart';
import 'package:create_challenge_ios_app/globals.dart' as globals;

class DataPage extends StatelessWidget {
  const DataPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: globals.getBackgroundColor,
        appBar: AppBar(
          title: Text(
            "Data",
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
              icon: const Icon(
                Icons.arrow_back,
              ),
            )
        ),
    );
  }
}