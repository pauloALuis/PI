import 'package:flutter/material.dart';
import 'package:app_pi/view/LoginPage.dart';

class UserOld extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 30 ,bottom: 10),
      child: Container(
        alignment: Alignment.topRight,
        //color: Colors.red,
        height: 20,
        child: Row(
          children: <Widget>[
            Text(
              'Já nos encontramos antes? ',
              style: TextStyle(
                fontSize: 17,
//                fontWeight: FontWeight.w700,

                color: Colors.white,
              ),
            ),
            FlatButton(
              padding: EdgeInsets.all(0),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child:  richText()
            ),
          ],
        ),
      ),
    );
  }



  RichText   richText(){
    /*Text(
      'EFETUAR LOGIN',
      style: TextStyle(
        fontSize: 17,
        color: Colors.white,
        fontWeight: FontWeight.w700,

      ),
      textAlign: TextAlign.right,
    ),*/


  return RichText(
      text: TextSpan(
      children: [
      TextSpan(
      text: "",
      ),
      WidgetSpan(
      child: Icon(Icons.arrow_back, size: 20, color: Colors.white,),
      ),
      TextSpan(
      text: "EFETUAR LOGIN",
        style: TextStyle(
          fontSize: 17,
          color: Colors.white,
          fontWeight: FontWeight.w700,)
      ),
      ],
      ),
  );
}




}