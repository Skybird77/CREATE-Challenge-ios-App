
import 'package:flutter/material.dart';
import 'package:create_challenge_ios_app/globals.dart' as globals;
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';

class MessageForm extends StatefulWidget {
  const MessageForm({super.key});
 
  @override 
  _MessageFormState createState() => _MessageFormState(); 
} 
  
class _MessageFormState extends State<MessageForm> { 
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _message = globals.getMessageText;
  final List<Contact> _contacts = globals.getContacts;
  final FlutterContactPicker _contactPicker = FlutterContactPicker();
  
  
  void _submitForm() { 
    if (_formKey.currentState!.validate()) { 
      _formKey.currentState!.save();
      
      setState(() {
        globals.setMessageText(_message);
        globals.setContacts(_contacts);
      });
      print("submiot");
      print(_message);
      print(_contacts);
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

    for (var element in _contacts) {
      contacts.add(Row(children: [
        Text(element.fullName!),
        IconButton(
          icon: const Icon(Icons.close),
          color: Colors.red[300],
          hoverColor: Colors.red[900],
          onPressed: () {
            setState(() {
              _contacts.removeAt(_contacts.indexWhere((contact) => contact.fullName == element.fullName));
            });
          },
        )
        ],));
    }
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
                validator: (string){ // Validation for contacts doesn't show but still checks
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
                  _message = value ?? _message;
                }, 
              ), 
              const SizedBox(height: 20.0), 
              ElevatedButton( 
                onPressed: _submitForm,
                child: const Text('Save'),
              ), 
            ], 
          ), 
        ), 
      ), 
    ); 
  } 
} 