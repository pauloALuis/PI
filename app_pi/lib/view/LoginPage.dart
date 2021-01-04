import 'package:app_pi/controller/SignupController.dart';
import 'package:app_pi/model/ClientModel.dart';
import 'package:app_pi/model/UserViewModel.dart';
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
  final _controller = new SignupController();
  final _model = new UserViewModel();
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
                passwordInput(),
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


  InputEmail(){

    return  Padding(
      padding: const EdgeInsets.only(top: 10, left: 50, right: 50),
      child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: _textUserNameField()
      ),
    );
  }

  TextFormField _textUserNameField(){

    return new TextFormField(
//      maxLength: 10,
        inputFormatters: [LengthLimitingTextInputFormatter(10),],
        validator: (value){
          if(value.isEmpty || value.length < 4){
            return 'field Email cannot be null and < 4';
          }
          return null;
        },
        onSaved: (val){
          _model.username = val;
        },
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
            child: _textFieldPass() )
    );
  }

  TextFormField _textFieldPass(){

    return new TextFormField(


        validator: (value){
          if(value.isEmpty || value.length < 4){
            return 'field Email cannot be null and < 4';
          }
          return null;
        },
        onSaved: (val){
          _model.passwords = val;
        },
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

}




