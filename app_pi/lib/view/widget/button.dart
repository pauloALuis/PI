import 'package:flutter/material.dart';
import 'package:app_pi/view/HomePage.dart';
import 'package:app_pi/controller/SignupController.dart';
import 'package:app_pi/services/ClientModel.dart';

class ButtonLogin extends StatefulWidget {
  GlobalKey<FormState> form;
  ButtonLogin({this.form});

  @override
  _ButtonLoginState createState() => _ButtonLoginState();
}

class _ButtonLoginState extends State<ButtonLogin> {
  GlobalKey<FormState> _formKey;
  final _controller = new SignupController();
  final _model = new ClientModel();

  @override
  Widget build(BuildContext context) {
    val();
    return Padding(
      padding: const EdgeInsets.only(top: 40, right: 50, left: 200),
      child: Container(
        alignment: Alignment.bottomRight,
        height: 40,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.blue[300],
              blurRadius: 10.0, // has the effect of softening the shadow
              spreadRadius: 1.0, // has the effect of extending the shadow
              offset: Offset(
                5.0, // horizontal, move right 10
                5.0, // vertical, move down 10
              ),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: flatButtonLogin ()

      ),
    );
  }


  void val(){
    _formKey = this.widget.form;
//    Toast.show("Toast plugin app"+ valor, context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);

  }
  void openNavigatorHomePage(){
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => HomePage()));
  }


  FlatButton flatButtonLogin (){
      return new  FlatButton(
        onPressed: () {

        if(_formKey.currentState.validate()){
          _formKey.currentState.save();
        }

        setState(() {
              print("testeeeee");


        } );
          },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'ENTRAR',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            Icon(
              Icons.arrow_forward,
              color: Colors.black,
            ),
          ],
        ),
      );

  }
}
