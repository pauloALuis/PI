import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class InputEmail extends StatefulWidget {
  @override
  _InputEmailState createState() => _InputEmailState();
}

class _InputEmailState extends State<InputEmail> {
  final TextEditingController _useController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 50, right: 50),
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: _textField()
      ),
    );
  }
}


TextField _ttextField(){
  return TextField(
    style: TextStyle(
      color: Colors.white,
    ),
    decoration: InputDecoration(
      border: InputBorder.none,
      fillColor: Colors.lightBlueAccent,
      labelText: 'Name -',
      labelStyle: TextStyle(
        color: Colors.white70,
      ),
    ),
  );
}


TextField _textField(){

  return new TextField(
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
        suffixText: 'User name',
        suffixStyle: new TextStyle(fontSize: 12),
        hintText: 'user name',
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
  );
}



TextField _textFieldPass(){

  return new TextField(
//      maxLength: 10,
      inputFormatters: [LengthLimitingTextInputFormatter(10),],
      controller: null,
      maxLines: 1,

      autofocus: true,
      textAlign: TextAlign.center,
      style: new TextStyle(color: Colors.black, fontSize: 20.0),
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(

        filled: false,
        fillColor: Colors.white,
        hoverColor: Colors.black,
//        helperText: 'User Name2',//texto por baixo do textField
        prefixIcon: Icon(Icons.domain_verification, color: Colors.white,),
        suffixText: 'User name',
        suffixStyle: new TextStyle(fontSize: 12),
        hintText: 'user name',
        hintStyle: new TextStyle(color: Colors.black45),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.yellowAccent),
        ),
        labelStyle: TextStyle(
            color: Colors.amber
        ),
        focusColor: Colors.amber,

      )
  );
}