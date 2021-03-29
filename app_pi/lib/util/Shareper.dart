import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/material.dart';


class EcraTeste extends StatefulWidget {
  EcraTeste({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _EcraTesteState createState() => _EcraTesteState();
}

class _EcraTesteState extends State<EcraTeste> {
  final EncryptedSharedPreferences encryptedSharedPreferences =
  EncryptedSharedPreferences();
  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();
  String value = '';

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    encryptedSharedPreferences.getString('sample').then((String _value) {
      setState(() {
        value = _value;
      });
    });
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                    decoration:
                    InputDecoration(hintText: 'Type text here and save'),
                    controller: myController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    }),
                Text('Current value: $value')
              ],
            ),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            encryptedSharedPreferences
                .setString('sample', myController.text)
                .then((bool success) {
              if (success) {
                print('success');
                encryptedSharedPreferences
                    .getString('sample')
                    .then((String _value) {
                  setState(() {
                    value = _value;
                  });
                });
              } else {
                print('fail');
              }
            });
          }
        },
        tooltip: 'Save',
        child: Icon(Icons.save),
      ),
    );
  }
}