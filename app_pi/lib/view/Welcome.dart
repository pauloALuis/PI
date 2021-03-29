import 'package:app_pi/model/User.dart';
import 'package:app_pi/Provider/UserProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  final User user;

  Welcome({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<UserProvider>(context).setUser(user);

    return Scaffold(
      body: Container(
        child: Center(
          child: Text("WELCOME PAGE"),
        ),
      ),
    );
  }
}
