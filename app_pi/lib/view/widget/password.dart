import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PasswordInput extends StatefulWidget {
  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
         child: _textFieldPass() )
      );
  }
}

//TextField(
//style: TextStyle(
//color: Colors.white,
//),
//obscureText: true,
//decoration: InputDecoration(
//border: InputBorder.none,
//labelText: 'Password',
//labelStyle: TextStyle(
//color: Colors.white70,
//),
//),
//),
//_textFieldPass


TextField _textFieldPass(){

  return new TextField(
      inputFormatters: [LengthLimitingTextInputFormatter(10),],
      controller: null,
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
        prefixIcon: Icon(Icons.arrow_forward_ios, color: Colors.white,),
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