library create_challenge_ios_app.globals;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';

// potential color palette
// https://coolors.co/palette/0d1b2a-1b263b-415a77-778da9-e0e1dd

  String _messageText = "I need help!"; // saved message to send to people
  List<Contact> _contacts = <Contact>[];

  Color _backgroundColor = const Color(0xFFFFFFFF);
  Color _ribbonColor = const Color(0xFFE9C9AA); //app bar at the top 
  Color _textColor = const Color(0xFF000000); 
  Color _panicButtonColor = const Color(0xFFF44336); // color of panic button on home 

  Color _messageSettingsIconColor = const Color(0xFF8BC34A); //top left
  Color _infoCardIconColor = const Color(0xFF2196F3); // top right
  Color _historyIconColor = const Color(0xFFFF9800); // bottom left
  Color _dataIconColor = const Color(0xFFFFC107); // bottom right


  String get getMessageText => _messageText;
  List<Contact> get getContacts => _contacts;

  Color get getBackgroundColor => _backgroundColor;
  Color get getRibbonColor => _ribbonColor;
  Color get getTextColor => _textColor;
  Color get getPanicButtonColor => _panicButtonColor;

  Color get getMessageSettingsIconColor => _messageSettingsIconColor;
  Color get getInfoCardIconColor => _infoCardIconColor;
  Color get getHistoryIconColor => _historyIconColor;
  Color get getDataIconColor => _dataIconColor;
  

  Future<bool> setMessageText(value) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  _messageText = value;
  return await sharedPreferences.setString('messageText', value);
  }

  Future<bool> setContacts(value) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  _contacts = value;

  List<String> contactsName = <String>[];
  List<String> contactsNumber = <String>[];
  value.forEach((contact) => {
    contactsName.add(contact.fullName),
    contactsNumber.add(contact.phoneNumbers[0]),
  });

  await sharedPreferences.setStringList("contactsName", contactsName);
  await sharedPreferences.setStringList("contactsNumber", contactsNumber);
  return true;
  }

  Future<bool> setBackgroundColor(value) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  _backgroundColor = value;
  return await sharedPreferences.setInt("backgroundColor", value);
  }

  Future<bool> setRibbonColor(value) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  _ribbonColor = value;
  return await sharedPreferences.setInt("ribbonColor", value);
  }

  Future<bool> setTextColor(value) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  _textColor = value;
  return await sharedPreferences.setInt("textColor", value);
  }

  Future<bool> setPanicButtonColor(value) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  _panicButtonColor = value;
  return await sharedPreferences.setInt("panicButtonColor", value);
  }

  Future<bool> setMessageSettingsIconColor(value) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  _messageSettingsIconColor = value;
  return await sharedPreferences.setInt("messageSettingsIconColor", value);
  }

  Future<bool> setInfoCardIconColor(value) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  _infoCardIconColor = value;
  return await sharedPreferences.setInt("infoCardIconColor", value);
  }

  Future<bool> setHistoryIconColor(value) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  _historyIconColor = value;
  return await sharedPreferences.setInt("historyIconColor", value);
  }

  Future<bool> setDataIconColor(value) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  _dataIconColor = value;
  return await sharedPreferences.setInt("dataIconColor", value);
  }

void initValues() async {
  // SharedPreferences.setMockInitialValues(
  //   {
  //     'messageText': "I really need help!",
  //     'contactsName': ["John Doe", "Jane Doe"],
  //     'contactsNumber': ["1234567891", "1234567891"],
  //     'backgroundColor': 0xFFFFFFFF,
  //     'ribbonColor': 0xffe9c9aa,
  //     'textColor': 0xFF000000,
  //     'panicButtonColor': 0xFFF44336,
  //     'messageSettingsIconColor': 0xFF8BC34A,
  //     'infoCardIconColor': 0xFF2196F3,
  //     'historyIconColor': 0xFFFF9800,
  //     'dataIconColor': 0xFFFFC107,
  //   });




    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    _messageText = sharedPreferences.getString('messageText') ?? _messageText;
    
    List<String> contactsName = sharedPreferences.getStringList("contactsName") ?? List<String>.empty();
    List<String> contactsNumber = sharedPreferences.getStringList("contactsNumber") ?? List<String>.empty();
    if (contactsName.length == contactsNumber.length) {
      for (int i = 0; i < contactsName.length; i++) {
        _contacts.add(Contact(fullName: contactsName[i], phoneNumbers: <String>[contactsNumber[i]]));
      }
    }
    else {
      print("Something wen't wrong while importing the saved contacts.");
    }
    print(_contacts);
    
    _backgroundColor = stringToColor(sharedPreferences.getInt('backgroundColor')) ?? _backgroundColor;
    _ribbonColor = stringToColor(sharedPreferences.getInt('ribbonColor')) ?? _ribbonColor;
    _textColor = stringToColor(sharedPreferences.getInt('textColor')) ?? _textColor;
    _panicButtonColor = stringToColor(sharedPreferences.getInt('panicButtonColor')) ?? _panicButtonColor;

    _messageSettingsIconColor = stringToColor(sharedPreferences.getInt('messageSettingsIconColor')) ?? _messageSettingsIconColor;
    _infoCardIconColor = stringToColor(sharedPreferences.getInt('infoCardIconColor')) ?? _infoCardIconColor;
    _historyIconColor = stringToColor(sharedPreferences.getInt('historyIconColor')) ?? _historyIconColor;
    _dataIconColor = stringToColor(sharedPreferences.getInt('dataIconColor')) ?? _dataIconColor;

  print(_messageText);
  print(_contacts);

}

Color? stringToColor(string) {
  if (string == null) {
    return null;
  }
  return Color(string);
}
