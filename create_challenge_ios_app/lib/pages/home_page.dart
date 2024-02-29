import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    Color backgroundColor = Colors.white;
    Color ribbonColor = Color(0xffe9c9aa);
    Color textColor = Colors.black;
    Color panicButtonColor = Colors.red;

    return Scaffold(
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
              onPressed: () {
                 // method runs when button pressed
              },
              icon: Icon(
                Icons.menu,
              ),
            )
        ),
        body: Column(
          children: <Widget>[
            Center(
              child: IconButton(
                iconSize: 400,
                color: panicButtonColor,
                onPressed: () {
                  print("Pressed the button!");
                },
                icon: Icon(
                  Icons.circle
                ),
              ),
            ),
            Expanded(
              child: FittedBox(
                child: FlutterLogo(),
              ),
            ),
          ],
        )
      );
  }
}