import 'package:flutter/material.dart';
import 'package:create_challenge_ios_app/globals.dart' as globals;

class MessageSettingsPageState extends StatefulWidget {
  const MessageSettingsPageState({super.key});

  @override
  __MessageSettingsPageStateState createState() => __MessageSettingsPageStateState();
}

class __MessageSettingsPageStateState extends State<MessageSettingsPageState> {
  @override
  Widget build(BuildContext context) {
    TextEditingController textFieldController = TextEditingController(text: globals.getMessageText);

    @override
    void initState() {
      super.initState();
      textFieldController = TextEditingController();
    }

    @override
    void dispose() {
      textFieldController.dispose();
      super.dispose();
    }

    return Scaffold(
      backgroundColor: globals.getBackgroundColor,
        appBar: AppBar(
          title: Text(
            "Message Settings",
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
            ),
        ),
        body: Column(
          children: <Widget>[
            Center(
              child: Text(
                "Contacts",
                style: TextStyle(
                  fontSize: 40,
                  color: globals.getTextColor,
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
                    color: globals.getTextColor,
                    onPressed: () {
                       print("Add Contact");
                    },
                    icon: const Icon(
                      Icons.add,
                    ),
                  )
                ],
              ),
            ),
            Center(
              child: Text(
                "Change Message",
                style: TextStyle(
                  fontSize: 40,
                  color: globals.getTextColor,
                )
                ),
            ),
            Container(
              alignment: Alignment.center,
              width: 500,
              decoration: BoxDecoration(
                border: Border.all(width: 3)
              ),
              child: TextField(
                textAlign: TextAlign.center,
                controller: textFieldController,
                decoration: null,
                onSubmitted: (String value) async {
                  setState(() { // If this doesn't set value on mobile, consider replacing this page with a form widget
                    globals.setMessageText(value);
                    print(globals.getMessageText);
                  });
                },
              ),
            ),
            //PUT ICON BUTTON HERE FOR SUBMIT
          ],
          )
    );
  }
}

/*
TextField(
                textAlign: TextAlign.center,
                controller: textFieldController,
                decoration: null,
                onSubmitted: (String value) async {
                  setState(() {
                    globals.messageText = value;
                  });
                },
              ),
              */

              /*TextFormField(
                textAlign: TextAlign.center,
                autocorrect: true,
                controller: textFieldController,
                decoration: null,
                onSaved: (String? value) {
                  setState(() {
                    if (value != null) {
                      globals.messageText = value;
                    }
                  });
                },
                validator: (String? value) {
                  if (value == null) {
                    return("This field is required.");
                  }
                  return (value.length > 100 ? "The character limit is 100. (Currently ${value.length})" : null);
                },
              )
              */