import 'package:flutter/material.dart';
import 'package:create_challenge_ios_app/globals.dart' as globals;

class MessageSettingsPage extends StatelessWidget {
  const MessageSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: globals.backgroundColor,
        appBar: AppBar(
          title: Text(
            "Message Settings",
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
            ),
        ),
        body: Column(
          children: <Widget>[
            const Center(
              child: Text(
                "Contacts",
                style: TextStyle(
                  fontSize: 40,
                  color: globals.textColor,
                )
                ),
            ),
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("This is a row of contacts"),
                  IconButton(
                    iconSize: 50,
                    color: globals.textColor,
                    onPressed: () {
                       print("Add Contact");
                    },
                    icon: Icon(
                      Icons.add,
                    ),
                  )
                ],
              ),
            ),
            const Center(
              child: Text(
                "Change Message",
                style: TextStyle(
                  fontSize: 40,
                  color: globals.textColor,
                )
                ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text("Type message here"),
            ),
            //PUT ICON BUTTON HERE FOR SUBMIT
          ],
          )
    );
  }
}