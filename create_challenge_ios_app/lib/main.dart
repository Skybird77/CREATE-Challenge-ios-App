// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'pages/home_page.dart';
//import 'pages/settings_page.dart';
import 'package:create_challenge_ios_app/globals.dart' as globals;

void main() {
  // print("im running");
  // globals.setNumber(5).then((string) {
  //   print(string);
  //   globals.getNumber().then((string) {print(string); print(globals.temp);});
  //   });
  

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    globals.initValues();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        platform: TargetPlatform.iOS,
      ),
          home: HomePage(),
    );
  }
}