
import 'package:app_pi/services/ClientModel.dart';
import 'package:app_pi/uteis/Useful.dart';
import 'package:flutter/material.dart';
import 'package:app_pi/view/widget/buttonNewUser.dart';
import 'package:app_pi/view/widget/inputEmail.dart';
import 'package:app_pi/view/widget/newEmail.dart';

import 'package:app_pi/view/widget/newName.dart';
import 'package:app_pi/view/widget/password.dart';
import 'package:app_pi/view/widget/singup.dart';
import 'package:app_pi/view/widget/textNew.dart';
import 'package:app_pi/view/widget/userOld.dart';
import 'package:flutter/services.dart';


class NewUser extends StatefulWidget {
  @override
  _NewUserState createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  final _formKey = GlobalKey<FormState>();

  bool _controllerTypeClient = false;
  TextEditingController _controllerFullName = new TextEditingController();
  TextEditingController _controllerUserName = new TextEditingController();
  TextEditingController _controllerPass     = new TextEditingController();
  TextEditingController _controllerPhone    = new TextEditingController();
  TextEditingController _controllerNIF      = new TextEditingController();

  ClientModel clientModel = new ClientModel();
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
                Row(
                  children: <Widget>[
                    SingUp(),
                    TextNew(),
                  ],
                ),
                inputName(),
//                inputLastName(),
                inputUsername(),
                inputNif(),
                inputPhone(),
                inputCustomer_type(),
                passwordInput(),
                buttonNewUser(),
                UserOld(),
              ],
            ),
          ],
        ))
      ),
    );
  }

//  "username":"pu3",
//  "password":"123456",
//  "email":"paulo@gmail.com",
//  "first_name":"paulo",
//  "last_name":"paulo1",
//  "customer_type":"1",
//  "person_id":"4",
//  "nif":"125456963",
//  "phone":"986754653",
//  "funds":"50.8"
//}


inputName(){

    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 50, right: 50),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
            validator: Useful.validateName,
            controller: _controllerFullName,


            //      maxLength: 10,
            inputFormatters: [LengthLimitingTextInputFormatter(10),],
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
//          suffixText: 'User nname',
//          suffixStyle: new TextStyle(fontSize: 12),
              hintText: 'Diogo Mariza Raquel',
              hintStyle: new TextStyle(color: Colors.black45),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.yellowAccent),

              ),
              labelText: 'Nome Completo',
            )
        ),
      ),
    );
  }

inputUsername(){

    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 50, right: 50),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: TextFormField(

            controller: _controllerUserName,
            validator: Useful.validateUsername,

            //      maxLength: 10,
            inputFormatters: [LengthLimitingTextInputFormatter(10),],
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
//          suffixText: 'User nname',
//          suffixStyle: new TextStyle(fontSize: 12),
              hintText: '_utilizador',
              hintStyle: new TextStyle(color: Colors.black45),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.yellowAccent),

              ),
              labelText: 'Nome de Utilizador',

//          labelStyle: TextStyle(
//              color: Colors.amber
//          ),
//        focusColor: Colors.amber,

            )
        ),
      ),
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

  inputNif(){

    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 50, right: 50),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
            validator: Useful.validateNIF,
            controller: _controllerNIF,

            //      maxLength: 10,
            inputFormatters: [LengthLimitingTextInputFormatter(10),],
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
//          suffixText: 'User nname',
//          suffixStyle: new TextStyle(fontSize: 12),
              hintText: '239 259 259 258',
              hintStyle: new TextStyle(color: Colors.black45),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.yellowAccent),

              ),
              labelText: 'Número de Contribuinte',

//          labelStyle: TextStyle(
//              color: Colors.amber
//          ),
//        focusColor: Colors.amber,

            )
        ),
      ),
    );
  }

  inputPhone(){

    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 50, right: 50),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
            validator: Useful.validatePhone,
            controller: _controllerPhone,
            //      maxLength: 10,
            inputFormatters: [LengthLimitingTextInputFormatter(10),],
            maxLines: 1,

            autofocus: true,
            textAlign: TextAlign.left,
            style: new TextStyle(color: Colors.black, fontSize: 17.0),
            cursorColor: Colors.black,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(

              filled: false,
              fillColor: Colors.white,
              hoverColor: Colors.black,
//        helperText: 'User Name2',//texto por baixo do textField
              prefixIcon: Icon(Icons.phone, color: Colors.white,),
//          suffixText: 'User nname',
//          suffixStyle: new TextStyle(fontSize: 12),
              hintText: '962 859 210',
              hintStyle: new TextStyle(color: Colors.black45),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.yellowAccent),

              ),
              labelText: 'Telemóvel',

//          labelStyle: TextStyle(
//              color: Colors.amber
//          ),
//        focusColor: Colors.amber,

            )
        ),
      ),
    );
  }

  inputPerson_id(){

    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 50, right: 50),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
            validator: (value){
              if(value.isEmpty || value.length < 1){
                return 'O nome não pode ser nulo';
              }
              return null;
            },
            onSaved: (val){
              print(val) ;
            },

            //      maxLength: 10,
            inputFormatters: [LengthLimitingTextInputFormatter(10),],
            controller: null,
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
//          suffixText: 'User nname',
//          suffixStyle: new TextStyle(fontSize: 12),
              hintText: 'user w',
              hintStyle: new TextStyle(color: Colors.black45),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.yellowAccent),

              ),
              labelText: 'User name',

//          labelStyle: TextStyle(
//              color: Colors.amber
//          ),
//        focusColor: Colors.amber,

            )
        ),
      ),
    );
  }

  inputCustomer_type(){

    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 50, right: 50),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: Row (children: [Text("Aluno"),
        Switch(value: _controllerTypeClient, onChanged: (bool value){
          setState(() {
            _controllerTypeClient = value;
          });

        })  , Text("Funcionário")],)
      ),
    );
  }

  buttonNewUser() {
 return Padding(
    padding: const EdgeInsets.only(top: 40, right: 50, left: 200),
    child: Container(
      alignment: Alignment.bottomRight,
      height: 50,
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
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: FlatButton(
        onPressed: (){
          _onClicke();

//          Navigator.pop(context);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'CRIAR CONTA',
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            Icon(
              Icons.arrow_forward,
              color: Colors.lightBlueAccent,
            ),
          ],
        ),
      ),
    ),
  );
}

  void _onClicke() {

    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
    }

  }

}
