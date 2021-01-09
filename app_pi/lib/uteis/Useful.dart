 import 'package:flutter/material.dart';

class Useful{
  //cor do fundo branco com tom verde
  static final  _colorBackGround =  Colors.lightGreen[100];
  // link para registar o utilizador
  static final String _urlSignup = 'https://projecthub.gotdns.ch:9191/api/register/';
  // link para Login o utilizador
  static final String _urlLogin = 'https://projecthub.gotdns.ch:9191/api/login/';


  static get colorBackGround => _colorBackGround;

  static String validateUsername(String value) {
    if(value.isEmpty || value.length < 2){
      return 'O Username não pode ser nulo e tem de ter mais de 2 carateres';
    }
    return null;
  }

  static String validateName(String value) {
    if(value.isEmpty || value.length < 2){
      return 'O Nome Completo não pode ser nulo e tem de ter mais de 2 carateres';
    }
    return null;
  }

  static String validateNIF(String value) {
    if(value.isEmpty || value.length < 5){
      return 'Insira o NIF correto, tem de ter mais de 5 numeros';
    }

    return null;
  }

  static String validatePhone(String value) {
    if(value.isEmpty || value.length < 8){
      return 'Insira o telemóvel correto, tem de ter mais de 8 numeros';
    }

    return null;
  }


  static String validateEmail(String value) {
      RegExp regex = new RegExp(r'^(([^<>()[\]\\,;:\s@\"]+(\[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
      if (value.isEmpty || regex.hasMatch(value) ) {
        return "Por favor insere um email valido";
      }
      return null;
  }

  String get urlSignup => _urlSignup;



  String get urlLogin => _urlLogin;
/*
set urlSignup(String value) {
    _urlSignup = value;
  }


  set urlLogin(String value) {
    _urlLogin = value;
  }*/
}