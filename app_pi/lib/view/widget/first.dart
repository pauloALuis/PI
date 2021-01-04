import 'package:flutter/material.dart';
import 'package:app_pi/view/NewUser.dart';

class FirstTime extends StatefulWidget {
  @override
  _FirstTimeState createState() => _FirstTimeState();
}

class _FirstTimeState extends State<FirstTime> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 30),
      child: Container(
        alignment: Alignment.topRight,
        //color: Colors.red,
        height: 20,
        child: Row(
          children: <Widget>[
            Text(
              'É sua primeira vez?',
              style: TextStyle(
                fontSize: 18.1,
                color: Colors.white70,
                fontWeight: FontWeight.w700,

              ),
            ),
            FlatButton(
              padding: EdgeInsets.all(0),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NewUser()));
              },
              child: Text(
                ' CRIAR CONTA',
                style: TextStyle(
                  fontSize: 21.1,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,

                ),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
