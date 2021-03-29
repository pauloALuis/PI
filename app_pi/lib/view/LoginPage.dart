import 'package:app_pi/model/User.dart';
import 'package:app_pi/Provider/UserProvider.dart';
import 'package:app_pi/util/Useful.dart';
import 'package:app_pi/view/MealsPage.dart';
import 'package:flutter/material.dart';
import 'package:app_pi/view/widget/first.dart';
import 'package:app_pi/view/widget/verticalText.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flushbar/flushbar.dart';

import 'widget/textLogin.dart';



class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _controllerPass    = new TextEditingController();
  TextEditingController _controllerUserName      = new TextEditingController();


  String username, pass;
  bool isLoading = false;


  @override
  Widget build(BuildContext context) {
    UserProvider auth = Provider.of<UserProvider>(context);


    var doLogin = () {
        final form = _formKey.currentState;
        if (form.validate()) {
          form.save();
          this.pass = _controllerPass.text;
          this.username = _controllerUserName.text;
         // Navigator.push(context, MaterialPageRoute(builder: (context)=> MealsPage()));
          Navigator.push(context, MaterialPageRoute(builder: (context)=> MealsPage()));

         /* auth.fetchUser(username, pass).then((value) {
            if(value){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> MealsPage()));
            }
            else{
              Flushbar(
                title: "Falha acesso",
                message: auth.getMessage().toString(),
                duration: Duration(seconds: 8),
                borderColor: Colors.green,
                backgroundColor: Useful.erroColors,
              ).show(context);
            }
              //Useful.toastMessage(message: auth.getMessage().toString());

          });*/


        }


    };





    Padding paddingButtonLogin(){
      return new Padding(
        padding: const EdgeInsets.only(top: 40, right: 50, left: 200),
        child: Container(
            alignment: Alignment.bottomRight,
            height: 40,
            width: MediaQuery.of(this.context).size.width,
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
            child: new  FlatButton(

              onPressed: doLogin,
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
            )

        ),
      );
    }



    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blueGrey, Colors.lightGreenAccent]),
        ),
        child:Form(key: this._formKey, child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(children: <Widget>[
                  VerticalText(),
                  TextLogin(),
                ]),
                this.inputUserName(),
                this.passwordInput(),
                auth.isLoading() ? CircularProgressIndicator(backgroundColor: Colors.green,) :
                paddingButtonLogin(),
                FirstTime(),
              ],
            ),
          ],
        ),)
      ),
    );
  }


  inputUserName(){

    return  Padding(
      padding: const EdgeInsets.only(top: 10, left: 50, right: 50),
      child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: this._textUserNameField()
      ),
    );
  }

  TextFormField _textUserNameField(){

    return new TextFormField(

        inputFormatters: [LengthLimitingTextInputFormatter(10),],
        controller: _controllerUserName,
        validator: Useful.validateUsername,

        maxLines: 1,

        autofocus: true,
        textAlign: TextAlign.left,
        style: new TextStyle(color: Colors.black, fontSize: 20.0),
        cursorColor: Colors.black,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          //errorText: ,

          filled: false,
          fillColor: Colors.white,
          hoverColor: Colors.black,
//        helperText: 'User Name2',//texto por baixo do textField
          prefixIcon: Icon(Icons.person, color: Colors.white,),
//          suffixText: 'Nome Utilizador',
          suffixStyle: new TextStyle(fontSize: 12),
//          hintText: 'Nome Utilizador',
          hintStyle: new TextStyle(color: Colors.black45),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.yellowAccent),

          ),
          labelText: 'Nome utilizador',

//          labelStyle: TextStyle(
//              color: Colors.amber
//          ),
//        focusColor: Colors.amber,

        )
    );
  }

  Padding passwordInput() {

    return new Padding(
        padding: const EdgeInsets.only(top: 10, left: 50, right: 50),
        child: Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            child: this._textFieldPass() )
    );
  }

  TextFormField _textFieldPass(){

    return new TextFormField(
      //enabled:  Provider.of<UserProvider>(context).isLoading(),

        validator: Useful.validateName,
        controller: _controllerPass,
        inputFormatters: [LengthLimitingTextInputFormatter(10),],

        maxLines: 1,
        obscureText: true,
        autofocus: true,
        textAlign: TextAlign.left,
        style: new TextStyle(color: Colors.black, fontSize: 20.0),
        cursorColor: Colors.black,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(

          filled: false,
          fillColor: Colors.white,
          hoverColor: Colors.black,
//        helperText: 'User Name2',//texto por baixo do textField
          prefixIcon: Icon(Icons.lock, color: Colors.white,),
//        suffixText: 'User name',
          suffixStyle: new TextStyle(fontSize: 12),
//        hintText: 'user name',
          hintStyle: new TextStyle(color: Colors.black45),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.yellowAccent),
          ),
          labelText: 'Password',
          focusColor: Colors.amber,

        )
    );
  }

  _containerVerify() {

    return new Center(child: Container(child: CircularProgressIndicator(backgroundColor: Colors.black,),),);
  }



}




