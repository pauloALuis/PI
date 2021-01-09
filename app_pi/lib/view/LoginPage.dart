import 'package:app_pi/controller/UserController.dart';
import 'package:app_pi/services/ClientModel.dart';
import 'package:app_pi/services/UserViewModel.dart';
import 'package:app_pi/uteis/Useful.dart';
import 'package:app_pi/view/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:app_pi/view/widget/first.dart';
import 'package:app_pi/view/widget/verticalText.dart';
import 'package:flutter/services.dart';

import 'widget/textLogin.dart';



class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _controllerPass    = new TextEditingController();
  TextEditingController _controllerUserName      = new TextEditingController();

  final _controller = new UserController();
  final _dataUserLogin = new UserViewModel();
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
                this._dataUserLogin.flagBussy ? Center(child: Container(child: CircularProgressIndicator(backgroundColor: Colors.yellow,),),):
                this.paddingButtonLogin(),
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
          child: this.flatButtonLogin ()

      ),
    );
  }



  void openNavigatorHomePage(){
    Navigator.push(this.context,
        MaterialPageRoute(builder: (context) => HomePage()));
  }



  FlatButton flatButtonLogin (){
    return new  FlatButton(
      onPressed: () {



        setState(() {

          this._onClickLogin();

        //            setState(() { });
          });

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
//      maxLength: 10,
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






  void _onClickLogin() {

    if(this._formKey.currentState.validate()){
       this._formKey.currentState.save();
    }
    openNavigatorHomePage();

    this._dataUserLogin.passwords = _controllerPass.text;
    this._dataUserLogin.username = _controllerUserName.text;
    this.isLoading = true;
    this._controller.userLogin(this._dataUserLogin);
  }

}




