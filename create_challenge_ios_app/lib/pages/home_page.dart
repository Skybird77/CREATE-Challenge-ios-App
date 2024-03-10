import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:create_challenge_ios_app/globals.dart' as globals;
import 'package:flutter_sms/flutter_sms.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {

    double pageIconSize = 175; //size of icons for pages

    return Scaffold(
        backgroundColor: globals.getBackgroundColor,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                child: ElevatedButton.icon(
                  onPressed: _runPanicButton, // could use database or webhook but should be sent off of phone
                  icon: Icon(
                    Icons.spatial_audio_off,
                    size: 150,
                    color: globals.getTextColor
                  ),
                  label: const Text(''),
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    fixedSize: const Size(500, 500),
                    backgroundColor: globals.getPanicButtonColor,
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  )
                ),
              ),
            ]
          )
        )
    );
  }
}

void _runPanicButton() {
  print("panic button");
  
  String message = "This is a test message!";
  List<String> recipents = ["2058724211"];

_sendSMS(message, recipents);
}

void _sendSMS(String message, List<String> recipents) async {
 String _result = await sendSMS(message: message, recipients: recipents)
        .catchError((onError) {
      print(onError);
    });
print(_result);
}