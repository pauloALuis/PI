import 'package:app_pi/controller/SignupController.dart';
import 'package:app_pi/model/ClientModel.dart';
import 'package:app_pi/view/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:app_pi/view/widget/first.dart';
import 'package:app_pi/view/widget/password.dart';
import 'package:app_pi/view/widget/verticalText.dart';

import 'widget/inputEmail.dart';
import 'widget/textLogin.dart';



class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _controller = new SignupController();
  final _model = new ClientModel();
  bool isLoading = false;

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
        child:Form(key: _formKey, child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(children: <Widget>[
                  VerticalText(),
                  TextLogin(),
                ]),
                InputEmail(),
                PasswordInput(),
                _model.flagBussy ? Center(child: Container(child: CircularProgressIndicator(backgroundColor: Colors.yellow,),),):
                paddingButtonLogin(),
//                ButtonLogin(form: _formKey),
                FirstTime(),
              ],
            ),
          ],
        ),)
      ),
    );
  }




  Padding paddingButtonLogin(){
    return new Padding(
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
          isLoading = true;
          _controller.loginClient(_model).then((data){
            print("token::: "  + data.token);
            //todo:
            setState(() { });
          });

//          openNavigatorHomePage();

        } );
//        openNavigatorHomePage();

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


