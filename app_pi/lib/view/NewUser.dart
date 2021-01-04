import 'package:flutter/material.dart';
import 'package:app_pi/view/widget/buttonNewUser.dart';
import 'package:app_pi/view/widget/inputEmail.dart';
import 'package:app_pi/view/widget/newEmail.dart';

import 'package:app_pi/view/widget/newName.dart';
import 'package:app_pi/view/widget/password.dart';
import 'package:app_pi/view/widget/singup.dart';
import 'package:app_pi/view/widget/textNew.dart';
import 'package:app_pi/view/widget/userOld.dart';


class NewUser extends StatefulWidget {
  @override
  _NewUserState createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blueGrey, Colors.lightGreenAccent]),
        ),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SingUp(),
                    TextNew(),
                  ],
                ),
                NewNome(),
                InputEmail(),
                NewEmail(),
                NewEmail(),
                NewEmail(),
                NewEmail(),
                NewEmail(),
                NewEmail(),

                PasswordInput(),
                ButtonNewUser(),
                UserOld(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
