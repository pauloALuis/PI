import 'package:flutter/material.dart';
import 'package:app_pi/view/LoginPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aquisição de Senhas',
      debugShowCheckedModeBanner: false,
//      theme: _buildShrineTheme(),
      theme: ThemeData(
        primaryColor: Colors.white ,
        hintColor: Colors.black,
      ),
      home: LoginPage(),
//      debugShowCheckedModeBanner: false,
    );
  }


}
