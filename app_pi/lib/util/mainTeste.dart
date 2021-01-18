import 'package:app_pi/util/Shareper.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Encrypted Shared Preferences Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EcraTeste(title: 'Encrypted Shared Preferences Demo Page') /***Chamar a class/View que quero testar fora da APP***/,
    );
  }
}
