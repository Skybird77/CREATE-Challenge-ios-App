// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'oldpages/home_page.dart';
import 'oldpages/settings_page.dart';
import 'pages/bottom_nav_bar.dart';
import 'package:create_challenge_ios_app/globals.dart' as globals;

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    globals.initValues();

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: BottomNavBar(),
    );
  }
}