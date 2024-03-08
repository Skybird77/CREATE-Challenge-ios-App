import 'package:create_challenge_ios_app/oldpages/data_page.dart';
import 'package:create_challenge_ios_app/oldpages/history_page.dart';
import 'package:create_challenge_ios_app/oldpages/info_card_page.dart';
import 'package:create_challenge_ios_app/oldpages/message_settings_page.dart';
import 'package:flutter/material.dart';
import 'package:create_challenge_ios_app/globals.dart' as globals;
import 'package:create_challenge_ios_app/oldpages/settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {

    double pageIconSize = 175; //size of icons for pages

    return Scaffold(
        backgroundColor: globals.getBackgroundColor,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text(
            "Home",
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
                 Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SettingsPage();
                 }));
              },
              icon: const Icon(
                Icons.menu,
              ),
            )
            
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {print("panic button");}, // could use database or webhook but should be sent off of phone
                  icon: Icon(
                    Icons.spatial_audio_off,
                    size: 100,
                    color: globals.getTextColor
                  ),
                  label: const Text(''),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    fixedSize: Size(300, 300),
                    backgroundColor: globals.getPanicButtonColor,
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  )
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const MessageSettingsPageState();
                   }));
                  },
                  icon: Icon(
                    Icons.message,
                    size: 100,
                    color: globals.getTextColor
                  ),
                  label: Text(''),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    fixedSize: Size(pageIconSize, pageIconSize),
                    backgroundColor: globals.getMessageSettingsIconColor,

                  )
                ),
                const Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 0.0, 30.0, 0.0),
                    ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const InfoCardPage();
                   }));
                  },
                  icon: Icon(
                    Icons.question_mark,
                    size: 100,
                    color: globals.getTextColor
                  ),
                  label: Text(''),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    fixedSize: Size(pageIconSize, pageIconSize),
                    backgroundColor: globals.getInfoCardIconColor,
          
                  )
                ),
                const Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                    ),
                ]
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                    ),
                ]
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const HistoryPage();
                   }));
                  },
                  icon: Icon(
                    Icons.book,
                    size: 100,
                    color: globals.getTextColor
                  ),
                  label: Text(''),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    fixedSize: Size(pageIconSize, pageIconSize),
                    backgroundColor: globals.getHistoryIconColor,
          
                  )
                ),
                const Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 0.0, 30.0, 0.0),
                    ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DataPage();
                   }));
                  },
                  icon: Icon(
                    Icons.show_chart,
                    size: 100,
                    color: globals.getTextColor
                  ),
                  label: Text(''),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    fixedSize: Size(pageIconSize, pageIconSize),
                    backgroundColor: globals.getDataIconColor,
          
                  )
                ),
                ]
              ),
            ],
          ),
        )
      );
  }
}