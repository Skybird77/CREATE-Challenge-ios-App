import 'package:flutter/material.dart';
import 'package:create_challenge_ios_app/globals.dart' as globals;

final _formKey = GlobalKey<FormState>();

String _Info = globals.getInfoText;

class InfoCardPage extends StatelessWidget {
  const InfoCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              initialValue: globals.getInfoText,
              decoration: const InputDecoration(labelText: 'Displayed Info'),
              maxLines: null,
              validator: (value){
                if( value == null || value.isEmpty){
                  return 'Enter Something';
                }
                return null;
              },
              onSaved: (value) { 
                  _Info = value ?? _Info;
                }, 
            ),
            const Padding(padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),),
            ElevatedButton(
              onPressed: (){
                _formKey.currentState!.save();
                globals.setInfoText(_Info);
                if(_formKey.currentState!.validate()){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Saved'),
                    ),
                  );
                }
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}