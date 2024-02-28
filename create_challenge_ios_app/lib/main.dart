// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    Color backgroundColor = Colors.white;
    Color ribbonColor = Color(0xffe9c9aa);
    Color textColor = Colors.black;

    void test() {
      print("running");
    }


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: Text(
            "Home",
            style: TextStyle(
              color: textColor,
              fontSize: 25,
              // fontWeight: FontWeight.bold,
            )),
          backgroundColor: ribbonColor,
          elevation: 0,
          // leading: Icon(Icons.menu),
          leading: IconButton(
              iconSize: 50,
              color: textColor,
              alignment: Alignment.bottomLeft,
              onPressed: () {
                test(); // method runs when button pressed
              },
              icon: Icon(
                Icons.menu,
              ),
            )
        ),
        // body: Container(
        //   width:  width,
        //   height:  60,
        //   decoration:  BoxDecoration (
        //     color:  ribbonColor,
        //   ),
        //   child: Center(
        //     child: Text(
        //       "Home",
        //       style: TextStyle(
        //         color: textColor,
        //         fontSize: 40,
        //         fontWeight: FontWeight.bold,

        //       )),
        //     ),
        // ),
      ),
    );
  }
}