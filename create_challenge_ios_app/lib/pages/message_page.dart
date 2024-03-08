
import 'package:flutter/material.dart';
import 'package:create_challenge_ios_app/globals.dart' as globals;
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';

class MyForm extends StatefulWidget { 
  @override 
  _MyFormState createState() => _MyFormState(); 
} 
  
class _MyFormState extends State<MyForm> { 
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _message = globals.getMessageText;
  List<Contact> _contacts = globals.getContacts;
  final FlutterContactPicker _contactPicker = FlutterContactPicker();
  
  
  void _submitForm() { 
    if (_formKey.currentState!.validate()) { 
      _formKey.currentState!.save();
      
      setState(() {
        globals.setMessageText(_message);
        globals.setContacts(_contacts);
      });
      print("submiot");
    } 
  }

  List<Widget> getContacts() {
    List <Widget> contacts = <Widget>[];
    Text text = const Text("Press + to add contacts");

    if (_contacts.isEmpty) {
      contacts.add(text);
    }
    else {
      contacts.remove(text);
    }

    _contacts.forEach((element) {
      contacts.add(Row(children: [
        Text(element.fullName!),
        IconButton(
          icon: const Icon(Icons.close),
          color: Colors.red[300],
          hoverColor: Colors.red[900],
          onPressed: () {
            setState(() {
              _contacts.removeAt(_contacts.indexWhere((contact) => _contacts == element.fullName));
            });
          },
        )
        ],));
    });
    return contacts; 
    }
  
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar( 
        title: const Text('Message Settings'), 
      ), 
      body: Form( 
        key: _formKey, // Associate the form key with this Form widget 
        child: Padding( 
          padding: const EdgeInsets.all(16.0), 
          child: Column( 
            children: <Widget>[
              FormField(
                builder: (state) {
                  return Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: getContacts(),
                      ),
                      const Spacer(),
                      IconButton(
                          color: Colors.black,
                          icon: const Icon(Icons.add, size: 40),
                          
                          onPressed: () async { // IO.Platform.isAndroid || IO.Platform.isIOS doesn't check properly
                            Contact? contact = await _contactPicker.selectContact();
                            setState(() {
                              if (contact != null) {
                                _contacts.add(contact);
                              }
                            });
                          },
                        ),
                    ]
                  );
                },
                validator: (string){ // Validation for contacts doesn't show but still should work.
                  if (_contacts.isEmpty) {
                    return 'Please choose an emergency contact.';
                  }
                return null;
                },
              ),
              
              TextFormField( 
                initialValue: globals.getMessageText,
                decoration: const InputDecoration(labelText: 'Message'),
                maxLines: null,
                validator: (value) { 
                  if (value!.isEmpty) { 
                    return 'Please enter a message.';
                  } 
                  return null;
                }, 
                onSaved: (value) { 
                  globals.setMessageText(value);
                }, 
              ), 
              SizedBox(height: 20.0), 
              ElevatedButton( 
                onPressed: _submitForm,
                child: Text('Save'),
              ), 
            ], 
          ), 
        ), 
      ), 
    ); 
  } 
} 