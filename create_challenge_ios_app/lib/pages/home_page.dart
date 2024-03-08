import 'package:flutter/material.dart';
import 'package:create_challenge_ios_app/globals.dart' as globals;

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
                  onPressed: () {print("panic button");}, // could use database or webhook but should be sent off of phone
                  icon: Icon(
                    Icons.spatial_audio_off,
                    size: 150,
                    color: globals.getTextColor
                  ),
                  label: const Text(''),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    fixedSize: Size(500, 500),
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